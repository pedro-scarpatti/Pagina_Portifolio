# Configurar Domínio Customizado

$domain = "portifolio.pedro-scarpatti.com"

Write-Host "Configurando dominio customizado..." -ForegroundColor Cyan

# Verificar se é repo git
if (!(Test-Path ".git")) {
    Write-Host "ERRO: Nao e um repositorio Git!" -ForegroundColor Red
    exit 1
}

# Caminho CNAME
$cnamePath = Join-Path (Get-Location) "CNAME"

# Criar ou corrigir CNAME
if (!(Test-Path $cnamePath)) {
    Write-Host "Criando arquivo CNAME..." -ForegroundColor Yellow
    Set-Content -Path $cnamePath -Value $domain -NoNewline
} else {
    $cnameContent = (Get-Content $cnamePath -Raw).Trim()

    if ($cnameContent -ne $domain) {
        Write-Host "Corrigindo CNAME..." -ForegroundColor Yellow
        Set-Content -Path $cnamePath -Value $domain -NoNewline
    }
}

Write-Host "CNAME OK: $domain" -ForegroundColor Green

# Verificar mudanças
$gitStatus = git status --porcelain

if (-not $gitStatus) {
    Write-Host "Nada para commit." -ForegroundColor Yellow
} else {
    Write-Host "Commitando..." -ForegroundColor Yellow

    try {
        git add CNAME
        git commit -m "Add/update custom domain: $domain"
        git push

        if ($LASTEXITCODE -ne 0) {
            Write-Host "Erro no git push!" -ForegroundColor Red
            exit 1
        }

        Write-Host "Push realizado com sucesso!" -ForegroundColor Green
    }
    catch {
        Write-Host "Erro no git: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "Proximos passos:" -ForegroundColor Cyan
Write-Host "1. Configure o dominio no GitHub Pages"
Write-Host "2. Configure DNS (A records GitHub Pages)"
Write-Host ""
Write-Host "URL final: https://$domain" -ForegroundColor Green