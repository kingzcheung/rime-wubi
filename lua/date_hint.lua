-- 九键日期提示
-- 在输入特定触发词时，在候选词列表中插入组合的日期候选
-- 触发词及对应日期：
--   今天/今日 → 当前日期（x月x日）
--   明天/明日 → 明天日期（x月x日）
--   昨天/昨日 → 昨天日期（x月x日）
-- 在 engine/filters 增加 - lua_filter@*date_hint

local trigger_map = {
    today     = { "今天", "今日" },
    tomorrow  = { "明天", "明日" },
    yesterday = { "昨天", "昨日" },
}
-- 注意：仅保留双字触发词，去掉"今"/"明"/"昨"单字。
-- 例：输入6464(ming)→单字"明"不触发；输入646474(ming ri)→"明日"触发。

-- 预构建快速查找用的 set 和偏移表
local trigger_set = {}
local offset_map = {}
for t, words in pairs(trigger_map) do
    local offset = 0
    if t == "tomorrow" then
        offset = 86400
    elseif t == "yesterday" then
        offset = -86400
    end
    for _, w in ipairs(words) do
        trigger_set[w] = true
        offset_map[w] = offset
    end
end

local function date_hint(input, env)
    local found = false

    for cand in input:iter() do
        if found then
            -- 已找到触发词：直接 yield，无需缓冲
            yield(cand)
        elseif trigger_set[cand.text] then
            -- 找到触发词：先 yield 触发词，再 yield 组合日期候选
            found = true
            yield(cand)

            -- 组合日期候选词复用触发词的 comment（如"jin ri"），
            -- 使 T9 消费逻辑能通过正常拼音匹配数字序列 → full commit。
            -- 若触发词无 comment（RIME 未产生 spelling hint），回退空字符串。
            local date_str = os.date("(%m月%d日)", os.time() + offset_map[cand.text])
            local combined_text = cand.text .. date_str
            local date_cand = Candidate("date_hint", cand.start, cand._end, combined_text, cand.comment or "")
            date_cand.quality = cand:get_genuine().quality - 1
            yield(date_cand)

            -- 触发词之后的所有候选词直接从迭代器 yield
            -- no extra buffer, no second loop
        else
            -- 未找到触发词：直接 yield
            yield(cand)
        end
    end
end

return date_hint
