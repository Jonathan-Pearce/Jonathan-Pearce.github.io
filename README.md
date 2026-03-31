# Jonathan Pearce

Personal website of Jonathan Pearce — projects, blog posts, datasets, and resources on data analytics, machine learning, and statistics.

**Live site:** <https://jonathan-pearce.github.io>

---

## Quick Start

### Prerequisites

| Tool | Install |
|------|---------|
| [Quarto](https://quarto.org/docs/get-started/) | `brew install quarto` or download from quarto.org |
| Python 3.10+ | `brew install python` or [python.org](https://www.python.org) |
| Jupyter + libs | `pip install jupyter numpy pandas matplotlib` |

### Local Preview

```bash
quarto preview          # opens a live-reloading dev server
```

### Build

```bash
quarto render           # outputs to _site/
```

---

## Project Structure

```
.
├── _quarto.yml              # ← Site configuration (nav, theme, footer)
├── custom.css               # ← Custom styles
├── index.qmd                # ← Landing page
├── about.qmd                # ← About page
├── blog/
│   ├── index.qmd            # ← Blog listing page
│   └── posts/
│       ├── template-post/   # ← Reusable blog post template (draft)
│       │   ├── index.qmd
│       │   └── thumbnail.png
│       └── example-eda/     # ← Example published post
│           ├── index.qmd
│           └── thumbnail.png
├── projects/
│   ├── index.qmd            # ← Projects listing page
│   └── example-project/
│       ├── index.qmd
│       └── thumbnail.png
├── resources/
│   └── index.qmd            # ← Curated resources page
├── images/
│   └── profile-placeholder.png
├── STYLE_GUIDE.md           # ← How to change colours, layout, etc.
├── .github/
│   └── workflows/
│       └── publish.yml      # ← CI/CD: build & deploy to GitHub Pages
└── .gitignore
```

---

## Adding Content

### New Blog Post

1. Copy `blog/posts/template-post/` to `blog/posts/<your-slug>/`.
2. Edit `index.qmd` — update the YAML front-matter (title, date, categories, etc.).
3. Replace `thumbnail.png` with your own image.
4. Set `draft: false` when ready to publish.
5. Commit & push — the GitHub Action builds and deploys automatically.

### New Project

1. Create a folder `projects/<your-slug>/`.
2. Add `index.qmd` (see `projects/example-project/index.qmd` as a reference).
3. Add a `thumbnail.png`.
4. Commit & push.

### Resources

Edit `resources/index.qmd` directly. Add links under the appropriate heading.

---

## Deployment (GitHub Pages)

Deployment is fully automated via GitHub Actions (`.github/workflows/publish.yml`).

### One-Time Setup

1. Go to **Settings → Pages** in your GitHub repository.
2. Under **Build and deployment → Source**, select **GitHub Actions**.
3. Push to the `main` branch — the workflow builds the site and deploys it.

### How It Works

```
push to main  ──▶  GitHub Actions  ──▶  quarto render  ──▶  deploy to GitHub Pages
```

- **Pull requests** trigger a build (no deploy) to catch errors early.
- **Pushes to `main`** trigger a build **and** deploy.
- The `execute: freeze: auto` setting in `_quarto.yml` caches computed outputs (plots, tables) so re-renders are fast and don't require Python on every build unless source code changes.

---

## Freeze (Computed Output Caching)

Quarto's `freeze: auto` caches the output of code cells in `_freeze/`. This means:

- Code is only re-executed when its source changes.
- You should commit the `_freeze/` directory so CI can use the cached outputs.
- To force re-execution: delete the relevant `_freeze/` folder and re-render.

---

## Customisation

See **[STYLE_GUIDE.md](STYLE_GUIDE.md)** for detailed instructions on:

- Changing the colour scheme and theme
- Modifying the navbar and footer
- Adjusting listing layouts (grid, list, table)
- Customising code appearance
- Updating your profile photo

---

## Tips for Low-Friction Maintenance

| Feature | Benefit |
|---------|---------|
| `freeze: auto` | Avoids re-running code unless source changes |
| `draft: true` | Hides posts from listings until you're ready |
| Listing pages | Automatically discover and display new posts/projects |
| `code-fold: true` | Keeps posts readable; readers can expand code on demand |
| `search: true` | Site-wide search — no extra setup needed |
| GitHub Actions | Zero-touch deployment on every push to `main` |

---

## License

Content © Jonathan Pearce. Site built with [Quarto](https://quarto.org).
