-- 英文候选自动空格（智能模式）
--
-- 由方案开关 english_spacing 控制，仅作用于候选模式（直输模式不走 translator/filter）。
-- 规则：上一次提交以英文字母结尾（且没有以空格结尾）时，给当前英文候选加一个前导空格。
-- 这样 "hello" 上屏后再选 "world" 得到 "hello world"；选中标点/空格/回车后不补。
--
-- 用法（english.schema.yaml）：
--   switches:
--     - name: english_spacing
--       reset: 1
--       states: [ 空格关, 空格开 ]
--   filters:
--     - lua_filter@*english_spacing

local M = {}

-- 候选/提交文本是否是一个英文词（允许词内撇号，如 he'll）
local function is_word(text)
  return text ~= nil and text:match("^[A-Za-z][A-Za-z']*$") ~= nil
end

-- 上一次提交是否以英文字母结尾（以空格/标点/数字/换行结尾都不补）
local function ends_with_letter(text)
  return text ~= nil and text:match("[A-Za-z]$") ~= nil
end

function M.func(input, env)
  local ctx = env.engine.context
  local prefix = ""
  if ctx:get_option("english_spacing") then
    local last = ctx.commit_history:back()
    if last and ends_with_letter(last.text) then
      prefix = " "
    end
  end

  for cand in input:iter() do
    if prefix ~= "" and is_word(cand.text) then
      yield(ShadowCandidate(cand, cand.type, prefix .. cand.text, cand.comment))
    else
      yield(cand)
    end
  end
end

return M
