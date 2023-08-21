locals {
  palavras_maisculas = { for k, v in var.palavras : k => [for s in v : upper(s)] }
  arq_template = var.arq_template
}