# scripturam

Write beautiful report with Markdown

## How to setpu

1. Get this repository `git clone https://github.com/atnanasi/scripturam.git`
2. Cd to repository `cd scripturam`
3. Install dependencies `yarn install`
4. Make template `docker run -it --rm -v "$(pwd):/root/.pandoc/templates" -v "$(pwd):/workspace" "kumassy/alpine-pandoc-ja" pandoc -D latex > template.tex`
5. Ready to build!

## How to build

`yarn run build <Markdown file>` to build.

*important: Your file path(include in-file path) has been resolved by repository root.*

## License

Release under the MIT License, see LICENSE.
