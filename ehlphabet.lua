if not minetest.get_modpath('ehlphabet') then return end

-- stickers of mandarin characters
minetest.register_craft({
    output = "ehlphabet:231140_sticker 4",
    recipe = {
        {"", "", ""},
        {"ehlphabet:78_sticker", "", ""},
        {"ehlphabet:69_sticker", "ehlphabet:75_sticker", "ehlphabet:79_sticker"}
    }
})

minetest.register_craft({
    output = "ehlphabet:229140_sticker 5",
    recipe = {
        {"ehlphabet:78_sticker", "ehlphabet:79_sticker", "ehlphabet:82_sticker"},
        {"ehlphabet:84_sticker", "ehlphabet:72_sticker", ""},
        {"", "", ""},
    }
})

minetest.register_craft({
    output = "ehlphabet:228184_sticker 5",
    recipe = {
        {"ehlphabet:69_sticker", "ehlphabet:65_sticker", "ehlphabet:83_sticker"},
        {"ehlphabet:84_sticker", "", "ehlphabet:83_sticker"},
        {"", "", ""},
    }
})

minetest.register_craft({
    output = "ehlphabet:230157_sticker 5",
    recipe = {
        {"ehlphabet:69_sticker", "ehlphabet:65_sticker", "ehlphabet:83_sticker"},
        {"ehlphabet:84_sticker", "", "ehlphabet:84_sticker"},
        {"", "", ""},
    }
})

minetest.register_craft({
    output = "ehlphabet:229141_sticker 5",
    recipe = {
        {"ehlphabet:83_sticker", "ehlphabet:79_sticker", "ehlphabet:85_sticker"},
        {"ehlphabet:84_sticker", "ehlphabet:72_sticker", ""},
        {"", "", ""},
    }
})

minetest.register_craft({
    output = "ehlphabet:232165_sticker 4",
    recipe = {
        {"ehlphabet:87_sticker", "ehlphabet:69_sticker", "ehlphabet:83_sticker"},
        {"ehlphabet:84_sticker", "", ""},
        {"", "", ""},
    }
})

minetest.register_craft({
    output = "ehlphabet:231171_sticker 7",
    recipe = {
        {"ehlphabet:83_sticker", "ehlphabet:84_sticker", "ehlphabet:65_sticker"},
        {"ehlphabet:84_sticker", "ehlphabet:73_sticker", "ehlphabet:79_sticker"},
        {"ehlphabet:78_sticker", "", ""},
    }
})
