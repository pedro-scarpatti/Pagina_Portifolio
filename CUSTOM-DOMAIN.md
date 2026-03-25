# 🚀 Configurar Domínio Customizado — portifolio.pedro-scarpatti

## ⚡ Script PowerShell Completo

```powershell
# 1. Criar arquivo CNAME (já criado)
# 2. Commit e push
cd "d:\Usuários\pedro.scarpatti\Desktop\Workspace\Dev\Pagina_Portifolio"
git add CNAME
git commit -m "🔗 Add custom domain: portifolio.pedro-scarpatti"
git push

# 3. Configurar no GitHub Pages
# Vá em: https://github.com/SEU-USUARIO/portfolio/settings/pages
# Em "Custom domain", digite: portifolio.pedro-scarpatti
# Clique Save
```

## 🌐 Configuração DNS (no seu registrador de domínio)

### Se "pedro-scarpatti" é um domínio apex (.com, .net, etc):

**Adicione estes registros A:**
```
Type: A
Name: portifolio
Value: 185.199.108.153

Type: A
Name: portifolio
Value: 185.199.109.153

Type: A
Name: portifolio
Value: 185.199.110.153

Type: A
Name: portifolio
Value: 185.199.111.153
```

### Se "pedro-scarpatti" é um subdomínio:

**Adicione este registro CNAME:**
```
Type: CNAME
Name: portifolio
Value: SEU-USUARIO.github.io
```

## ⏱️ Timeline

1. **Agora**: Execute o script acima (commit + push)
2. **GitHub**: Configure custom domain em Settings → Pages
3. **DNS**: Configure registros no seu registrador (GoDaddy, Namecheap, etc)
4. **24-48h**: DNS propaga globalmente
5. **✅**: `portifolio.pedro-scarpatti` estará funcionando

## 🔍 Verificar se funcionou

```bash
# Testar DNS
nslookup portifolio.pedro-scarpatti

# Deve retornar os IPs do GitHub:
# 185.199.108.153
# 185.199.109.153
# 185.199.110.153
# 185.199.111.153
```

## 🐛 Troubleshooting

### "DNS not configured"
→ Aguarde 24h para propagação DNS

### "Domain not verified"
→ Verifique se digitou corretamente no GitHub Pages

### "SSL certificate error"
→ GitHub gera automaticamente certificado SSL (Let's Encrypt)

---

**Execute o script e configure o DNS!** 🚀