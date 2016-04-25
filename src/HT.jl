module HT

const LIBHTS = "/haplox/users/guo/Github/htslib/libhts.so"
const LIBKSTR = "/haplox/users/guo/Github/HTSLIB.jl/src/libkstr.so"

macro fncall(fn, return_type)
    f = eval(fn)
    quote
        ccall(($(Meta.quot(f)), $LIBHTS), $return_type,
              ())
    end
end


macro fncall(fn, return_type, argtypes, args...)
    f = eval(fn)
    args = map(esc, args)
    quote
        ccall(($(Meta.quot(f)), $LIBHTS), $return_type,
              $argtypes, $(args...))
    end
end

macro kstrcall(fn, return_type)
    f = eval(fn)
    quote
        ccall(($(Meta.quot(f)), $LIBKSTR), $return_type,
              ())
    end
end

include("type.jl")
include("fn.jl")
include("io.jl")
include("utils.jl")


end
