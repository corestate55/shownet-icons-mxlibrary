# shownet-icons-mxlibrary
Draw.io (Diagrams.net) icon library of Interop ShowNet Icons 2023

## Interop ShowNet Icons

Download: https://www.interop.jp/2023/shownet/concept/#dl

> all materials and objects in this archive are available
> under the Creative Commons Attribution-ShareAlike License
> https://creativecommons.org/licenses/by-sa/4.0/
>
> ShowNet Icons (C) 2023 Interop Tokyo ShowNet NOC Team / CC BY-SA 4.0

## mxlibrary converter

[yaegashi/icon-collection-mxlibrary: Azure Icon Collection mxlibrary for diagrams.net (formerly draw.io)](https://github.com/yaegashi/icon-collection-mxlibrary)

## How to use

See [Interop ShowNet アイコンを draw.io (diagrams.net) で使おう - Qiita](https://qiita.com/corestate55/items/ace4ed28703fa071e55d) in detail.

### Diagrams.net

* [Open Diagrams.net with shownet-icons.xml](https://app.diagrams.net/?splash=0&clibs=Uhttps%3A%2F%2Fraw.githubusercontent.com%2Fcorestate55%2Fshownet-icons-mxlibrary%2Fmain%2Fshownet-icons.xml)

### VSCode Draw.io Integration

Install [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio) in VSCode at first.

Edit settings.json

```json
    "hediet.vscode-drawio.customLibraries": [
        {
            "entryId": "Interop ShowNet Icons",
            "libName": "Interop ShowNet Icons",
            "url": "https://raw.githubusercontent.com/corestate55/shownet-icons-mxlibrary/main/shownet-icons.xml"
        }
    ]
```

and [+ More Shapes] - [Interop ShowNet Icons] in VSCode.

### Draw.io desktop app

Download [shownet-icons.xml](./shownet-icons.xml) and import it as library: [File] - [Open Library].

```shell
curl -LO https://raw.githubusercontent.com/corestate55/shownet-icons-mxlibrary/main/shownet-icons.xml
```

## How to convert SVG files to mxlibrary file

Clone this repository and exec [convert.sh](./convert.sh). The script does:
* Download ShowNet Icon zip file and extract it into `assets` directory
* Pull mxlibrary converter repository and install npm packages for it
* Convert SVG files to mxlibrary file

## License

Interop ShowNet Icons is distributed under CC BY-SA 4.0. Therefore shownet-icons.xml inherits the same license.

[![CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-sa/4.0/)
