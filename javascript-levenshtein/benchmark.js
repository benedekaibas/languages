function levenshteinDistance(str1, str2) {
    if (typeof str1 !== 'string' || typeof str2 !== 'string') {
        throw new TypeError('Both arguments must be strings');
    }

    if (str1 === str2) return 0;
    if (!str1.length) return str2.length;
    if (!str2.length) return str1.length;

    if (str1.length > str2.length) {
        [str1, str2] = [str2, str1];
    }

    const m = str1.length;
    const n = str2.length;

    let prevRow = new Uint32Array(m + 1);
    let currRow = new Uint32Array(m + 1);

    for (let i = 0; i <= m; i++) {
        prevRow[i] = i;
    }

    for (let j = 1; j <= n; j++) {
        currRow[0] = j;

        for (let i = 1; i <= m; i++) {
            const cost = str1[i - 1] === str2[j - 1] ? 0 : 1;
            currRow[i] = Math.min(
                prevRow[i] + 1,
                currRow[i - 1] + 1,
                prevRow[i - 1] + cost
            );
        }

        [prevRow, currRow] = [currRow, prevRow];
    }

    return prevRow[m];
}

function benchmark() {
    const str1 = "example";
    const str2 = "samples";
    const start = process.hrtime();
    const distance = levenshteinDistance(str1, str2);
    const end = process.hrtime(start);
    const timeInMs = (end[0] * 1000) + (end[1] / 1000000);
    console.log(`Node.js: ${timeInMs} ms`);
}

benchmark();