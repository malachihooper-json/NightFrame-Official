# Makefile for NIGHTFRAME research paper export

.PHONY: whitepaper clean

whitepaper: NIGHTFRAME-whitepaper.pdf NIGHTFRAME-whitepaper.docx

NIGHTFRAME-whitepaper.pdf: docs/WHITEPAPER.md
	pandoc docs/WHITEPAPER.md \
		--from markdown+tex_math_dollars \
		--standalone \
		--citeproc \
		-o $@

NIGHTFRAME-whitepaper.docx: docs/WHITEPAPER.md
	pandoc docs/WHITEPAPER.md \
		--standalone \
		-o $@

clean:
	rm -f NIGHTFRAME-whitepaper.pdf NIGHTFRAME-whitepaper.docx
