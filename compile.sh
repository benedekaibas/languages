function compile {
  if [ -d ${1} ]; then
    echo ""
    echo "Compiling $1"
    ${2} 2>/dev/null
    result=$?
    if [ $result -ne 0 ]; then
      echo "Failed to compile ${1} with command: ${2}"
    fi
  fi
}

# Uncomment only the parts you need
compile 'c3' 'c3c compile c3/code.c3 -o c3/code'
compile 'c' 'gcc -O3 c/code.c -o c/code'
compile 'cpp' 'g++ -std=c++23 -march=native -O3 -Ofast -o cpp/code cpp/code.cpp'
# Uncomment and fix only the necessary packages here
compile 'go' 'go build -ldflags "-s -w" -o go/code go/code.go'  # Skipping Go
# compile 'hare' 'hare build -R -o hare/code hare/code.ha'  # Skipping Hare
compile 'jvm' 'javac jvm/code.java'
compile 'js' 'bun build --bytecode --compile js/code.js --outfile js/bun'
compile 'rust' 'cargo build --manifest-path rust/Cargo.toml --release'
compile 'kotlin' 'kotlinc -include-runtime kotlin/code.kt -d kotlin/code.jar'
compile 'kotlin' 'kotlinc-native kotlin/code.kt -o kotlin/code -opt'
compile 'dart' 'dart compile exe dart/code.dart -o dart/code --target-os=macos'
compile 'inko' '(cd inko && inko build --opt=aggressive code.inko -o code)'
compile 'nim' 'nim c -d:danger --opt:speed -d:passC -x:off -a:off -o:nim/code nim/code.nim'
compile 'nim' 'nim -d:release --threads:off --stackTrace:off --lineTrace:off --opt:speed -x:off -o:nim/code c nim/code.nim'
compile 'sbcl' 'sbcl --noinform --non-interactive --load "common-lisp/code.lisp" --build'
compile 'fpc' 'fpc -O3 fpc/code.pas'
compile 'modula2' 'gm2 -O3 modula2/code.mod -o modula2/code'
compile 'crystal' 'crystal build -o crystal/code --release crystal/code.cr'
compile 'scala' 'scala-cli --power package --assembly scala/code.scala -f -o scala/code'
compile 'scala' 'scala-cli --power package --native scala/code.scala -f -o scala/code-native --native-mode release-full'
compile 'scala' 'scala-cli --power package --js scala/codeJS.scala -f -o scala/code.js --js-module-kind commonjs --js-mode fullLinkJS'
compile 'scala' 'bun build --bytecode --compile scala/code.js --outfile scala/bun'
compile 'ldc2' 'ldc2 -O3 -release -boundscheck=off -mcpu=native flto=thin d/code.d'
compile 'odin' 'odin build odin/code.odin -o:speed -file -out:odin/code'
compile 'objc' 'clang -O3 -framework Foundation objc/code.m -o objc/code'
compile 'fortran' 'gfortran -O3 fortran/code.f90 -o fortran/code'
compile 'zig' 'zig build-exe -O ReleaseFast -femit-bin=zig/code zig/code.zig'
compile 'lua' 'luajit -b lua/code.lua lua/code'
compile 'swift' 'swiftc -O -parse-as-library -Xcc -funroll-loops -Xcc -march=native -Xcc -ftree-vectorize -Xcc -ffast-math swift/code.swift -o swift/code'
compile 'csharp' 'dotnet publish csharp -o csharp/code'
compile 'csharp' 'dotnet publish csharp -o csharp/code-aot /p:PublishAot=true /p:OptimizationPreference=Speed'
compile 'fsharp' 'dotnet publish fsharp -o fsharp/code'
compile 'fsharp' 'dotnet publish fsharp -o fsharp/code-aot /p:PublishAot=true /p:OptimizationPreference=Speed'
compile 'haskell' 'ghc -O2 -fllvm haskell/code.hs -o haskell/code || { echo "ghc: cannot compile with llvm backend; fallback to use default backend"; ghc -O2 haskell/code.hs -o haskell/code; }'
compile 'v' 'v -prod -cc clang -cflags -march=native -d no_backtrace -o v/code v/code.v'
compile 'emojicode' 'emojicodec emojicode/code.emojic'
compile 'chez' "echo '(compile-program \"chez/code.ss\")' | chez --optimize-level 3 -q"
# Uncomment and fix only the necessary packages here
# compile 'clojure' "(cd clojure && mkdir -p classes && clojure -Sdeps '{:paths [\".\"]}' -M -e \"(compile 'code)\")"  # Skipping Clojure
# compile 'clojure-native-image' "(cd clojure-native-image && clojure -M:native-image)"  # Skipping Clojure Native Image
# Using `compile` for Emacs Lisp silently fails
# (cd emacs-lisp && emacs -Q --batch --eval '(byte-compile-file "code.el")')  # Skipping Emacs Lisp
# (cd emacs-lisp && emacs -Q --batch --eval '(native-compile "code.el" (expand-file-name "code.eln"))')  # Skipping Emacs Lisp
# (cd racket && raco make code.rkt && raco demod -o code.zo code.rkt && raco exe -o code code.zo)  # Skipping Racket

# Pip-related dependencies to install before running
# pip3.12 install numba --break-system-packages
