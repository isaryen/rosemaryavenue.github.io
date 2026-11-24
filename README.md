# Rosemary Avenue

A plain text website template. Hand-written HTML, one stylesheet, no images,
no JavaScript, no webfonts, no analytics, no build step.

Live: <https://isaryen.github.io/rosemaryavenue.github.io/>

## Layout

```
index.html        home page
writing.html      post index
posts/            one HTML file per post
about.html        about page
contact.html      contact page
404.html          not-found page
template.html     skeleton for a new page
style.css         the only stylesheet
Makefile          serve / check / links
```

## Use it

1. Clone, or fork this repo, and rename it to `yourname.github.io`.
2. Edit `index.html` — the title, the tagline, the nav, the body.
3. Copy `template.html` to make a new page.
4. Commit and push to `main`. GitHub Pages publishes it.

```bash
git clone https://github.com/isaryen/rosemaryavenue.github.io.git
cd rosemaryavenue.github.io
make serve            # http://localhost:8080
make check            # every page has doctype, charset, viewport, stylesheet
make links            # every local href points at a file that exists
```

## Adding a post

```bash
cp template.html posts/my-post.html
$EDITOR posts/my-post.html      # prefix relative links with ../
# then add a <li> to the list in writing.html
git add posts/my-post.html writing.html
git commit -m "New post: my post"
git push
```

## House rules

- **Text first.** If a page reads badly in a terminal, it is too complicated.
- **One stylesheet.** Extend `style.css`; do not write inline styles.
- **No tracking.** No cookies, no third-party scripts, no webfonts.
- **Short pages.** One screen of intro, then the content.

## Notes

- `.nojekyll` makes GitHub Pages serve files verbatim (no Jekyll build).
- `style.css` follows your OS light/dark setting via `prefers-color-scheme`.
- The font is the system monospace stack — nothing is downloaded.
- A `@media print` block strips nav and footer for printing.

## License

MIT — see [LICENSE](LICENSE).
