from pathlib import Path
from platform import system

from setuptools import Extension, find_packages, setup
from setuptools.command.build import build
from wheel.bdist_wheel import bdist_wheel


class Build(build):
    def run(self):
        if (block_queries := Path("tree-sitter-quarkdown", "queries")).is_dir():
            dest = Path(self.build_lib, "tree_sitter_quarkdown", "queries", "quarkdown")
            self.copy_tree(str(block_queries), str(dest))
        if (inline_queries := Path("tree-sitter-quarkdown-inline", "queries")).is_dir():
            dest = Path(self.build_lib, "tree_sitter_quarkdown", "queries", "quarkdown_inline")
            self.copy_tree(str(inline_queries), str(dest))
        super().run()


class BdistWheel(bdist_wheel):
    def get_tag(self):
        python, abi, platform = super().get_tag()
        if python.startswith("cp"):
            python, abi = "cp39", "abi3"
        return python, abi, platform


setup(
    packages=find_packages("bindings/python"),
    package_dir={"": "bindings/python"},
    package_data={
        "tree_sitter_quarkdown": ["*.pyi", "py.typed"],
        "tree_sitter_quarkdown.queries": ["*.scm"],
    },
    ext_package="tree_sitter_quarkdown",
    ext_modules=[
        Extension(
            name="_binding",
            sources=[
                "bindings/python/tree_sitter_quarkdown/binding.c",
                "tree-sitter-quarkdown/src/parser.c",
                "tree-sitter-quarkdown/src/scanner.c",
                "tree-sitter-quarkdown-inline/src/parser.c",
                "tree-sitter-quarkdown-inline/src/scanner.c",
            ],
            extra_compile_args=(
                ["-std=c11"] if system() != "Windows" else []
            ),
            define_macros=[
                ("Py_LIMITED_API", "0x03090000"),
                ("PY_SSIZE_T_CLEAN", None)
            ],
            include_dirs=["tree-sitter-quarkdown/src"],
            py_limited_api=True,
        )
    ],
    cmdclass={
        "build": Build,
        "bdist_wheel": BdistWheel
    },
    zip_safe=False
)
