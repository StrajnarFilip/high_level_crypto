defmodule Common.GenerateKey do

    def key256bits do
        :crypto.strong_rand_bytes(32)
    end

    def key128bits do
        :crypto.strong_rand_bytes(16)
    end

    def key2048bits do
        :crypto.strong_rand_bytes(256)
    end

    def key4096bits do
        :crypto.strong_rand_bytes(512)
    end

end