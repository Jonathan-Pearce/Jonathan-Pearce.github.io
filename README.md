# Casual Inference — Quarto website
# Casual Inference — Quarto website

This repository contains a starter Quarto website for the "Casual Inference" personal portfolio.

Quick start

1. Install Quarto: https://quarto.org/docs/get-started/
2. From the repository root, preview the site locally:

```bash
quarto preview --port 4317
```

3. To render the static site to `_site`:

```bash
quarto render
```

Files of interest

- `_quarto.yml` — site configuration and navbar
- `index.qmd` — homepage
- `blog/index.qmd`, `projects/index.qmd`, `resources/index.qmd`, `about/index.qmd` — pages
- `projects/project-template.qmd` — template for new project pages
- `posts/` — blog posts (example post included)
- `styles/` and `images/` — assets

Customize

- Replace the placeholder LinkedIn URL in `_quarto.yml` and `index.qmd`.
- Add real project entries in `projects/index.qmd` and individual project pages using `projects/project-template.qmd`.
- Add more posts to `posts/` using date-prefixed file names (e.g. `posts/2025-11-16-title.qmd`).

Creating new posts

- Quick helper script: create a dated post from the repository root:

```bash
# create a new post with an auto-generated slug
bash scripts/new-post.sh "My Great Post"

# or provide an explicit slug
bash scripts/new-post.sh "My Great Post" my-great-post
```

- The script creates `posts/YYYY-MM-DD-slug.qmd` with front matter (`draft: true`). You can then edit that file and set `draft: false` when ready to publish.
- There's also a `posts/post-template.qmd` you can copy when making custom posts.

Post summary / excerpts

- Add a `summary:` field to each post's front matter (one-sentence). The blog listing is configured to render excerpts from this `summary` field.
- The `posts/post-template.qmd` includes a `summary` example; the `scripts/new-post.sh` creates posts with minimal front matter — edit the generated file to add a `summary` before publishing.

Commit-and-open flow

The helper script supports a `--commit` (or `-c`) flag to automatically stage and commit the created post and then open it in your editor. Example:

```bash
# create, git add, commit, and open in your editor
bash scripts/new-post.sh --commit "My Great Post"

# explicit slug
bash scripts/new-post.sh -c "My Great Post" my-great-post
```

Notes:
- The script uses `git` if run inside a git repository. If not inside a repo it will still create the file but skip committing.
- The script respects your `EDITOR` or `VISUAL` environment variables; if those are not set it falls back to `code`.

GitHub Pages deployment

This repository includes a GitHub Actions workflow at `.github/workflows/deploy.yml` that builds the Quarto site and publishes the generated site to a `gh-pages` branch. The workflow runs on pushes to `main` and will:

- install Quarto
- render the site (`quarto render`)
- publish the contents of `_site/` to the `gh-pages` branch

After pushing this repository to GitHub:

1. Open the repository Settings → Pages.
2. Under "Source", choose the `gh-pages` branch and the `/ (root)` folder, then save.
3. The site will be published at `https://<your-username>.github.io/<repo-name>/` (or `https://<your-username>.github.io/` for repositories named `username.github.io`).

Notes

- Using `gh-pages` keeps build artifacts out of the `main` branch; if you prefer, the workflow can be modified to push to `main` for a user/organization site.
- To use a custom domain, add a `CNAME` file at the repository root (or set the domain in the Pages settings). If you add a `CNAME`, include it in the published site (see workflow customization).

Troubleshooting

- The workflow uses the default `GITHUB_TOKEN` to publish — no extra secrets are required.
- If the site doesn't appear after the workflow completes, double-check the Pages source is set to `gh-pages` and allow a minute for the site to become available.
