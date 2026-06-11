# Makefile for NIGHTFRAME research paper export

.PHONY: whitepaper clean

whitepaper: NIGHTFRAME-whitepaper.pdf NIGHTFRAME-whitepaper.docx

NIGHTFRAME-whitepaper.pdf: docs/WHITEPAPER.md
	# Try xelatex first (commonly available). If it fails, fall back to docx → pdf conversion.
	@if command -v xelatex >/dev/null 2>&1; then \
		pandoc docs/WHITEPAPER.md \
			--from markdown+tex_math_dollars \
			--standalone \
			--citeproc \
			--pdf-engine=xelatex \
			-o $@; \
	else \
		pandoc docs/WHITEPAPER.md \
			--from markdown+tex_math_dollars \
			--standalone \
			--citeproc \
			-o NIGHTFRAME-whitepaper.docx && \
		pandoc NIGHTFRAME-whitepaper.docx -o $@; \
	fi

NIGHTFRAME-whitepaper.docx: docs/WHITEPAPER.md
	pandoc docs/WHITEPAPER.md \
		--standalone \
		-o $@

clean:
	rm -f NIGHTFRAME-whitepaper.pdf NIGHTFRAME-whitepaper.docx
