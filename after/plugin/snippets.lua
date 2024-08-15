local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("clojure", {
  s("p", {
    t("(println "),
    i(1),
    t(")"),
  }),
  s("defsc", {
    t("(defsc "),
    i(1),
    t("[this {:keys [:id] :as props}]"),
    t({ "", "" }),
    t("{:query [:id] :ident :id}"),
    t({ "", "" }),
    t("(dom/div))"),
    t({ "", "" }),
    t("(def ui-"),
    t("(comp/factory {:keyfn :id}))"),
  })
})

ls.add_snippets("javascript", {
  s("p", {
    t("console.log("),
    i(1),
    t(")"),
  })
})

ls.add_snippets("go", {
  s("p", {
    t("fmt.Println("),
    i(1),
    t(")"),
  }),
  s("for", {
    t("for _, "),
    i(1),
    t(" := range "),
    i(2),
    t(" {"),
    i(3),
    t("}"),
  }),
  s("e", {
    t("if err != nil {"),
    i(1),
    t("}"),
  }),
})
