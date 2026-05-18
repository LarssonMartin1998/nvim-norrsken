; extends

; defer/errdefer are scope-exit handlers — flow control (teal)
"defer" @keyword.exception
"errdefer" @keyword.exception

; orelse is optional flow control (like else for optionals) — conditional (teal)
"orelse" @keyword.conditional

; unreachable exits the current code path — like return/break (teal)
"unreachable" @keyword.return
