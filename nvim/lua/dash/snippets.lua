local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--[[
---------  INFO: Snippets for C
--]]

ls.add_snippets("c", {
    s("bp", {
        t({"#include <stdio.h>", ""}),
        t("int main() {"),
        t({"", "\t"}),
        i(1),
        t({"", "\tprintf(\"Hello, World!\\n\");"}),
        t({"", "\treturn 0;"}),
        t({"", "}"})
    }),
})

--[[
---------  INFO: Snippets for c++
--]]
--
ls.add_snippets("cpp", {
    s("bp", {
        t({"#include <iostream>", ""}),
        t({"", "using namespace std;", ""}),
        t({"", "int main() {"}),
        t({"", "\t"}),
        i(1),
        t({"", "\tcout << \"Hello, World!\" << endl;"}),
        t({"", "\treturn 0;"}),
        t({"", "}"})
    }),
})

