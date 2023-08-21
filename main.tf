resource "random_shuffle" "random_substantivos" {
  count = var.qtde_arquivos
  input = local.palavras_maisculas["substantivos"]
}
resource "random_shuffle" "random_adjetivos" {
  count = var.qtde_arquivos
  input = local.palavras_maisculas["adjetivos"]
}
resource "random_shuffle" "random_verbos" {
  count = var.qtde_arquivos
  input = local.palavras_maisculas["verbos"]
}
resource "random_shuffle" "random_adverbios" {
  count = var.qtde_arquivos
  input = local.palavras_maisculas["adverbios"]
}
resource "random_shuffle" "random_numeros" {
  count = var.qtde_arquivos
  input = local.palavras_maisculas["numeros"]
}
resource "local_file" "jogodepalavras" {
  count    = var.qtde_arquivos
  filename = "${path.cwd}/textos/olamundo-${count.index}.txt"
  content = var.arq_template != "" ? var.arq_template : templatefile("${path.module}/templates/OlaMundo.txt",
    {
      substantivos = random_shuffle.random_substantivos[count.index].result
      adjetivos    = random_shuffle.random_adjetivos[count.index].result
      verbos       = random_shuffle.random_verbos[count.index].result
      numeros      = random_shuffle.random_numeros[count.index].result
      adverbios    = random_shuffle.random_adverbios[count.index].result
  })
}