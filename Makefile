# Rosemary Avenue — plain text site
# No build step. This is convenience only.

PORT ?= 8080

.PHONY: serve check links clean

serve:
	@echo "Serving on http://localhost:$(PORT) (Ctrl-C to stop)"
	python3 -m http.server $(PORT)

# Fail if any page is missing its doctype, charset, viewport, or stylesheet.
check:
	@fail=0; for f in $$(find . -name '*.html' -not -path './.git/*'); do \
		grep -qi '<!DOCTYPE html>' $$f || { echo "no doctype: $$f"; fail=1; }; \
		grep -qi 'charset="utf-8"' $$f || { echo "no charset: $$f"; fail=1; }; \
		grep -qi 'name="viewport"' $$f || { echo "no viewport: $$f"; fail=1; }; \
		grep -qi 'style.css' $$f || { echo "no stylesheet: $$f"; fail=1; }; \
	done; [ $$fail -eq 0 ] && echo "all pages OK"

# Report local hrefs that point at files which do not exist.
links:
	@for f in $$(find . -name '*.html' -not -path './.git/*'); do \
		dir=$$(dirname $$f); \
		for href in $$(sed -n 's/.*href="\([^"]*\)".*/\1/p' $$f | grep -v '^http' | grep -v '^mailto' | grep -v '^#'); do \
			target=$$href; \
			[ -n "$$target" ] || continue; \
			if [ "$${target:0:1}" = "/" ]; then p="$${target:1}"; else p="$$dir/$$target"; fi; \
			[ -e "$$p" ] || echo "broken in $$f: $$href"; \
		done; \
	done; echo "link check done"

clean:
	find . -name '.DS_Store' -delete
