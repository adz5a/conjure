local _0_0 = nil
do
  local name_23_0_ = "conjure.promise"
  local loaded_23_0_ = package.loaded[name_23_0_]
  local module_23_0_ = nil
  if ("table" == type(loaded_23_0_)) then
    module_23_0_ = loaded_23_0_
  else
    module_23_0_ = {}
  end
  module_23_0_["aniseed/module"] = name_23_0_
  module_23_0_["aniseed/locals"] = (module_23_0_["aniseed/locals"] or {})
  module_23_0_["aniseed/local-fns"] = (module_23_0_["aniseed/local-fns"] or {})
  package.loaded[name_23_0_] = module_23_0_
  _0_0 = module_23_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {a = "conjure.aniseed.core", nvim = "conjure.aniseed.nvim", uuid = "conjure.uuid"}}
  return {require("conjure.aniseed.core"), require("conjure.aniseed.nvim"), require("conjure.uuid")}
end
local _2_ = _1_(...)
local a = _2_[1]
local nvim = _2_[2]
local uuid = _2_[3]
do local _ = ({nil, _0_0, nil})[2] end
local state = nil
do
  local v_23_0_ = (_0_0["aniseed/locals"].state or {})
  _0_0["aniseed/locals"]["state"] = v_23_0_
  state = v_23_0_
end
local new = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function new0()
      local id = uuid.v4()
      a.assoc(state, id, {["done?"] = false, id = id, val = nil})
      return id
    end
    v_23_0_0 = new0
    _0_0["new"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["new"] = v_23_0_
  new = v_23_0_
end
local done_3f = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function done_3f0(id)
      return a["get-in"](state, {id, "done?"})
    end
    v_23_0_0 = done_3f0
    _0_0["done?"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["done?"] = v_23_0_
  done_3f = v_23_0_
end
local deliver = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function deliver0(id, val)
      if (false == done_3f(id)) then
        a["assoc-in"](state, {id, "val"}, val)
        a["assoc-in"](state, {id, "done?"}, true)
      end
      return nil
    end
    v_23_0_0 = deliver0
    _0_0["deliver"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["deliver"] = v_23_0_
  deliver = v_23_0_
end
local deliver_fn = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function deliver_fn0(id)
      local function _3_(_241)
        return deliver(id, _241)
      end
      return _3_
    end
    v_23_0_0 = deliver_fn0
    _0_0["deliver-fn"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["deliver-fn"] = v_23_0_
  deliver_fn = v_23_0_
end
local close = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function close0(id)
      local val = a["get-in"](state, {id, "val"})
      a.assoc(state, id, nil)
      return val
    end
    v_23_0_0 = close0
    _0_0["close"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["close"] = v_23_0_
  close = v_23_0_
end
local await = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function await0(id, opts)
      return nvim.fn.wait(a.get(opts, "timeout", 10000), ("luaeval(\"require('conjure.promise')['done?']('" .. id .. "')\")"), a.get(opts, "interval", 50))
    end
    v_23_0_0 = await0
    _0_0["await"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["await"] = v_23_0_
  await = v_23_0_
end
return nil