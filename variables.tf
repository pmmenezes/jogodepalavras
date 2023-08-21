variable "qtde_arquivos" {
  default = 15
  type    = number
}
variable "palavras" {
  description = "Um conjunto de palavras para usar no jogo de palavras"
  type = object({
    substantivos = list(string),
    adjetivos    = list(string),
    verbos       = list(string),
    adverbios    = list(string),
    numeros      = list(number),
  })
    validation {
    condition     = length(var.palavras["substantivos"]) >= 5
    error_message = "O minino de substantivos deve ser 5"
  }
}

variable "arq_template" {
  default = ""
}