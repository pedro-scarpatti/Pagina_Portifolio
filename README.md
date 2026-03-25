
```bash
# Opção 1: Clique duplo em index.html

# Opção 2: Com Python
python -m http.server 8000

# Opção 3: Com Node
npx http-server
```

### GitHub Pages

```bash
git init
git add .
git commit -m "🚀 Deploy portfólio"
git branch -M main
git remote add origin https://github.com/seu-usuario/portfolio.git
git push -u origin main
```

Depois em **Settings** → **Pages** → Selecione `main` + `/root` → **Save**

URL: `https://seu-usuario.github.io/portfolio`

## 🎨 Personalizar

1. **Suas redes**: Procure por `seu-github`, `seu-linkedin`, `seu-email@exemplo.com`
2. **Cores**: Edite `:root` no CSS do `index.html`
3. **Projetos**: 
   - Coloque o HTML novo em `projects/`
   - Atualize `const projects = []` no script do `index.html`
   - Crie um novo `.project-card` na seção de projetos

---

**Construído com ❤️** 🚀
