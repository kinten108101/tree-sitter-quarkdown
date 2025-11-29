#!/usr/bin/env node

const { execSync } = require("child_process");
const { join } = require("path");

for (const dir of ["tree-sitter-quarkdown", "tree-sitter-quarkdown-inline"]) {
  console.log(`building ${dir}`);
  execSync("tree-sitter generate", {
    stdio: "inherit",
    cwd: join(__dirname, "..", dir)
  });
}
