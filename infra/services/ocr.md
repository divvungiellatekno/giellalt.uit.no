# OCR service

The _OCR service_ consists of a backend API, which is a third-party written
Rust api, which enables sending images up to it, and choosing a
[Tesseract](https://tesseract-ocr.com/) model to read the text out of the
image.

We run [Nasjonalbiblioteket's models](https://data.norge.no/nn/datasets/2c2193da-0f78-30e6-89e1-c560b99f404d/ocr-modellar-for-samiske-sprak), as well as our
own. The ones from _NB_ generally produces more accurate readings.

Accompanying the backend API, there is also a simple frontend application,
written in SvelteKit.
