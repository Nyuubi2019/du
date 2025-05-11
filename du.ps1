Param (
    [string]$Path,
    [string]$Unit = "GB"
)

# Se nenhum parâmetro for passado, exibe as instruções de uso
if (-not $Path) {
    Write-Host "Use:"
    Write-Host "-Path `"C:\MeuDiretório`""
    Write-Host "-Unit MB  # Exibe em MB"
    Write-Host "-Unit GB  # Exibe em GB"
    exit
}

# Define o fator de conversão baseado na unidade escolhida
$fator = if ($Unit -eq "MB") { 1MB } else { 1GB }

# Calcula e exibe o tamanho total dos arquivos na unidade escolhida
Get-ChildItem -Path $Path -Recurse | ForEach-Object { $_.Length / $fator } | Measure-Object -Sum