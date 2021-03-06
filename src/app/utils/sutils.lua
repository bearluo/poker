--
-- Author: shineflag
-- Date: 2017-06-28 21:35:02
--

-- character table string
local base64map='JKsMNo59tu34QRSTABCDEFGde678fvwxyzpq012ghijklmnHIOPrWXYZabcUVL_/'

local sendmap = {
    [0] =   0x70,0x2F,0x40,0x5F,0x44,0x8E,0x6E,0x45,0x7E,0xAB,0x2C,0x1F,0xB4,0xAC,0x9D,0x91,
            0x0D,0x36,0x9B,0x0B,0xD4,0xC4,0x39,0x74,0xBF,0x23,0x16,0x14,0x06,0xEB,0x04,0x3E,
            0x12,0x5C,0x8B,0xBC,0x61,0x63,0xF6,0xA5,0xE1,0x65,0xD8,0xF5,0x5A,0x07,0xF0,0x13,
            0xF2,0x20,0x6B,0x4A,0x24,0x59,0x89,0x64,0xD7,0x42,0x6A,0x5E,0x3D,0x0A,0x77,0xE0,
            0x80,0x27,0xB8,0xC5,0x8C,0x0E,0xFA,0x8A,0xD5,0x29,0x56,0x57,0x6C,0x53,0x67,0x41,
            0xE8,0x00,0x1A,0xCE,0x86,0x83,0xB0,0x22,0x28,0x4D,0x3F,0x26,0x46,0x4F,0x6F,0x2B,
            0x72,0x3A,0xF1,0x8D,0x97,0x95,0x49,0x84,0xE5,0xE3,0x79,0x8F,0x51,0x10,0xA8,0x82,
            0xC6,0xDD,0xFF,0xFC,0xE4,0xCF,0xB3,0x09,0x5D,0xEA,0x9C,0x34,0xF9,0x17,0x9F,0xDA,
            0x87,0xF8,0x15,0x05,0x3C,0xD3,0xA4,0x85,0x2E,0xFB,0xEE,0x47,0x3B,0xEF,0x37,0x7F,
            0x93,0xAF,0x69,0x0C,0x71,0x31,0xDE,0x21,0x75,0xA0,0xAA,0xBA,0x7C,0x38,0x02,0xB7,
            0x81,0x01,0xFD,0xE7,0x1D,0xCC,0xCD,0xBD,0x1B,0x7A,0x2A,0xAD,0x66,0xBE,0x55,0x33,
            0x03,0xDB,0x88,0xB2,0x1E,0x4E,0xB9,0xE6,0xC2,0xF7,0xCB,0x7D,0xC9,0x62,0xC3,0xA6,
            0xDC,0xA7,0x50,0xB5,0x4B,0x94,0xC0,0x92,0x4C,0x11,0x5B,0x78,0xD9,0xB1,0xED,0x19,
            0xE9,0xA1,0x1C,0xB6,0x32,0x99,0xA3,0x76,0x9E,0x7B,0x6D,0x9A,0x30,0xD6,0xA9,0x25,
            0xC7,0xAE,0x96,0x35,0xD0,0xBB,0xD2,0xC8,0xA2,0x08,0xF3,0xD1,0x73,0xF4,0x48,0x2D,
            0x90,0xCA,0xE2,0x58,0xC1,0x18,0x52,0xFE,0xDF,0x68,0x98,0x54,0xEC,0x60,0x43,0x0F
}           



local recvmap = {
    [0] =   0x51,0xA1,0x9E,0xB0,0x1E,0x83,0x1C,0x2D,0xE9,0x77,0x3D,0x13,0x93,0x10,0x45,0xFF,
            0x6D,0xC9,0x20,0x2F,0x1B,0x82,0x1A,0x7D,0xF5,0xCF,0x52,0xA8,0xD2,0xA4,0xB4,0x0B,
            0x31,0x97,0x57,0x19,0x34,0xDF,0x5B,0x41,0x58,0x49,0xAA,0x5F,0x0A,0xEF,0x88,0x01,
            0xDC,0x95,0xD4,0xAF,0x7B,0xE3,0x11,0x8E,0x9D,0x16,0x61,0x8C,0x84,0x3C,0x1F,0x5A,
            0x02,0x4F,0x39,0xFE,0x04,0x07,0x5C,0x8B,0xEE,0x66,0x33,0xC4,0xC8,0x59,0xB5,0x5D,
            0xC2,0x6C,0xF6,0x4D,0xFB,0xAE,0x4A,0x4B,0xF3,0x35,0x2C,0xCA,0x21,0x78,0x3B,0x03,
            0xFD,0x24,0xBD,0x25,0x37,0x29,0xAC,0x4E,0xF9,0x92,0x3A,0x32,0x4C,0xDA,0x06,0x5E,
            0x00,0x94,0x60,0xEC,0x17,0x98,0xD7,0x3E,0xCB,0x6A,0xA9,0xD9,0x9C,0xBB,0x08,0x8F,
            0x40,0xA0,0x6F,0x55,0x67,0x87,0x54,0x80,0xB2,0x36,0x47,0x22,0x44,0x63,0x05,0x6B,
            0xF0,0x0F,0xC7,0x90,0xC5,0x65,0xE2,0x64,0xFA,0xD5,0xDB,0x12,0x7A,0x0E,0xD8,0x7E,
            0x99,0xD1,0xE8,0xD6,0x86,0x27,0xBF,0xC1,0x6E,0xDE,0x9A,0x09,0x0D,0xAB,0xE1,0x91,
            0x56,0xCD,0xB3,0x76,0x0C,0xC3,0xD3,0x9F,0x42,0xB6,0x9B,0xE5,0x23,0xA7,0xAD,0x18,
            0xC6,0xF4,0xB8,0xBE,0x15,0x43,0x70,0xE0,0xE7,0xBC,0xF1,0xBA,0xA5,0xA6,0x53,0x75,
            0xE4,0xEB,0xE6,0x85,0x14,0x48,0xDD,0x38,0x2A,0xCC,0x7F,0xB1,0xC0,0x71,0x96,0xF8,
            0x3F,0x28,0xF2,0x69,0x74,0x68,0xB7,0xA3,0x50,0xD0,0x79,0x1D,0xFC,0xCE,0x8A,0x8D,
            0x2E,0x62,0x30,0xEA,0xED,0x2B,0x26,0xB9,0x81,0x7C,0x46,0x89,0x73,0xA2,0xF7,0x72
}


--返回当前字符实际占用的字节数
local function string_sub_byte_count(str, index)
    local byte = string.byte(str, index)
    local count = 1
    if byte == nil then
        count = 0
    elseif byte > 0 and byte <= 127 then
        count = 1
    elseif byte>=192 and byte<=223 then
        count = 2
    elseif byte>=224 and byte<=239 then
        count = 3
    elseif byte>=240 and byte<=247 then
        count = 4
    end
    return count;
end

--返回包含utf8字符中 第index字符的位置
local function string_sub_true_index(str, index)
    local cur_index = 0
    local i = 1;
    local last_count = 0
    repeat 
        last_count = string_sub_byte_count(str, i)
        i = i + last_count;
        cur_index = cur_index + 1;
    until(cur_index >= index);
    return i - last_count;
end

--获取中英混合UTF8字符串的真实字符数量
local function utf8_len(str)
    local cur_index = 0
    local i = 1;
    local last_count = 1
    repeat 
        last_count = string_sub_byte_count(str, i)
        i = i + last_count;
        cur_index = cur_index + 1;
    until(last_count == 0);
    return cur_index - 1;
end

--截取中英混合的UTF8字符串，eindex可缺省
local function utf8_sub(str, start, eindex)
    if start < 0 then
        start = utf8_len(str) + start + 1;
    end

    if eindex and eindex < 0 then
        eindex = utf8_len(str) + eindex + 1;
    end

    if not eindex then 
        return string.sub(str, string_sub_true_index(str, start));
    else
        return string.sub(str, string_sub_true_index(str, start), string_sub_true_index(str, eindex+1)-1 );
    end
end


--从中英混合字符串中 获取固定 宽度的字符串  1个英文占1个宽度 1个中方占两个  (自定义的宽度)
local function utf8_sub_width(str, start, width)
	local tw = 0 --
	local ulen = utf8_len(str)
    local cur_index = 0
    local i = 1;
    local last_count = 0
    repeat 
        last_count = string_sub_byte_count(str, i)
        i = i + last_count;
        cur_index = cur_index + 1;
    until(cur_index >= start);
    i = i - last_count;  --找到起始位置
    cur_index = cur_index - 1
    local sindex = i 
    repeat 
        last_count = string_sub_byte_count(str, i)
        i = i + last_count;
        if last_count > 2 then 
        	tw = tw + 2 
        else 
        	tw = tw + 1
        end
        cur_index = cur_index + 1;
        print(cur_index)
    until(cur_index >= ulen or tw >= width)
    if tw > width then 
    	i = i - last_count 
    end
    print(sindex,i)
    return string.sub(str, sindex, i-1)
end

--加密
local function encrypt(buffer)
    local ret = ""
    for k=1,#buffer do
        local v = string.byte(buffer,k)
        ret = ret .. string.char(sendmap[v])
    end
    return ret
    -- local t = {}
    -- for k,v in pairs({string.byte(buffer,1,-1) }) do
    --     t[k] = sendmap[v]
    -- end
    -- return string.char(unpack(t))
end

--解密
local function decrypt(buffer)
    local ret = ""
    for k=1,#buffer do
        local v = string.byte(buffer,k)
        ret = ret .. string.char(recvmap[v])
    end
    return ret
    -- local t = {}
    -- for k,v in pairs({string.byte(buffer,1,-1) }) do
    --     t[k] = recvmap[v]
    -- end
    -- return string.char(unpack(t))
end


local function encode_base64(source_str)  
    local s64 = ''  
    local str = source_str  
  
    while #str > 0 do  
        local bytes_num = 0  
        local buf = 0  
  
        for byte_cnt=1,3 do  
            buf = (buf * 256)  
            if #str > 0 then  
                buf = buf + string.byte(str, 1, 1)  
                str = string.sub(str, 2)  
                bytes_num = bytes_num + 1  
            end  
        end  
  
        for group_cnt=1,(bytes_num+1) do  
            local b64char = math.fmod(math.floor(buf/262144), 64) + 1  
            s64 = s64 .. string.sub(base64map, b64char, b64char)  
            buf = buf * 64  
        end  
  
        for fill_cnt=1,(3-bytes_num) do  
            s64 = s64 .. '='  
        end  
    end  
  
    return s64  
end

local function decode_base64(str64)  
    local temp={}  
    for i=1,64 do  
        temp[string.sub(base64map,i,i)] = i  
    end  
    temp['=']=0  
    local str=""  
    for i=1,#str64,4 do  
        if i>#str64 then  
            break  
        end  
        local data = 0  
        local str_count=0  
        for j=0,3 do  
            local str1=string.sub(str64,i+j,i+j)  
            if not temp[str1] then  
                return  
            end  
            if temp[str1] < 1 then  
                data = data * 64  
            else  
                data = data * 64 + temp[str1]-1  
                str_count = str_count + 1  
            end  
        end  
        for j=16,0,-8 do  
            if str_count > 0 then  
                str=str..string.char(math.floor(data/math.pow(2,j)))  
                data=math.mod(data,math.pow(2,j))  
                str_count = str_count - 1  
            end  
        end  
    end  
  
    local last = tonumber(string.byte(str, string.len(str), string.len(str)))  
    if last == 0 then  
        str = string.sub(str, 1, string.len(str) - 1)  
    end  
    return str  
end  


string.utf8_len = utf8_len 
string.utf8_sub = utf8_sub
string.utf8_sub_width = utf8_sub_width
string.encrypt = encrypt
string.decrypt = decrypt
string.encode_base64 = encode_base64
string.decode_base64 = decode_base64
