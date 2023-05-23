# Pages

These are Pages used in the game. They are *real* pages, unlike a lot of the existing SPA solutions that use JS to make "virtual" pages.
Every Page loads `main.mjs` and it's own `pages/pageName.mjs`.

## Why?
 Why not use one of the many existing SPA reoutes?

 Simple answer, I want this project to be "build free" using only modern features. This is possible beause browsers support modules. This means there is no need for a build tool to gather all the used source and combine it into a finial artifact. The browser can load modules as needed, and cache them effecently.

This means there is no transcompling step because all the code is loaded int he browser exactly as it appears in the source code. This make debugging vastly easier.

