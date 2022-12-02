defmodule Common.GenerateKey do

    def key256bits do
        :crypto.strong_rand_bytes(32)
    end

    def key128bits do
        :crypto.strong_rand_bytes(16)
    end
end