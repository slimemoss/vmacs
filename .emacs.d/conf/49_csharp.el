(use-package csharp-mode
  :ensure t
  :hook
  (csharp-mode . lsp)
  :custom
  (lsp-csharp-solution-file "/home/slimemoss/work/dev/unity/poke/poke.sln"))
