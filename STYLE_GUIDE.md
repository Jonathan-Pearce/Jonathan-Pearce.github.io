# Style Guide — Casual Inference

This document explains how to customise the look-and-feel of the website.

---

## 1. Theme

The site uses Quarto's built-in **Bootswatch** themes.
Edit the `format.html.theme` section in `_quarto.yml`:

```yaml
format:
  html:
    theme:
      light: flatly    # ← change to cosmo, lux, minty, journal, etc.
      dark: darkly      # ← dark mode variant
```

Full list of themes: <https://quarto.org/docs/output-formats/html-themes.html>

To disable dark mode, remove the `dark:` line.

---

## 2. Custom Colours

Brand colours are defined as CSS custom properties in `custom.css`:

```css
:root {
  --ci-primary: #2c3e50;   /* dark blue-grey */
  --ci-accent: #18bc9c;    /* teal accent  */
  --ci-light-bg: #f8f9fa;  /* light background */
}
```

Change these values to update colours site-wide.

---

## 3. Custom CSS

All custom CSS lives in `custom.css` and is loaded via `_quarto.yml`:

```yaml
format:
  html:
    css: custom.css
```

You can add any CSS here. For deeper theme changes, create a `custom.scss`
file (Sass) and reference it under `theme:` instead.

---

## 4. Fonts

Override fonts by adding a Google Fonts import at the top of `custom.css`:

```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');
body { font-family: 'Inter', sans-serif; }
```

---

## 5. Navbar

Edit the `website.navbar` section in `_quarto.yml` to change:

- **Background colour**: `background: dark` (or `light`, `primary`, or a hex colour)
- **Logo**: add `logo: images/logo.png`
- **Links**: add/remove items under `left:` or `right:`

---

## 6. Footer

Edit `website.page-footer` in `_quarto.yml`:

```yaml
page-footer:
  center: "© 2026 Jonathan Pearce"
```

---

## 7. Listing Layouts (Blog / Projects)

Each listing page supports three layout types:

| Type      | Description                         |
|-----------|-------------------------------------|
| `default` | Compact list with optional image    |
| `grid`    | Thumbnail cards in a responsive grid|
| `table`   | Sortable/filterable data table      |

Change the `type:` field in the listing YAML of `blog/index.qmd` or `projects/index.qmd`.

Other useful listing options:

- `page-size: 10` — paginate after 10 items
- `sort-ui: true` — add a sort dropdown
- `filter-ui: true` — add a search box
- `categories: true` — show a category sidebar
- `grid-columns: 3` — number of columns in grid layout

---

## 8. Code Appearance

Global defaults in `_quarto.yml`:

```yaml
format:
  html:
    code-fold: true     # collapse code by default
    code-tools: true    # show/hide all code toggle
    code-copy: true     # copy button on code blocks
    highlight-style: github   # syntax highlighting
```

Per-post overrides go in the post's YAML front-matter.

---

## 9. Profile Photo

Replace `images/profile-placeholder.png` with your photo.
For best results, use a square image (at least 400 × 400 px).
