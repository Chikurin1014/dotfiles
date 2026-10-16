// postinstall of `npm:@github/copilot-language-server`.
// The package's `bin` points outside the package (`../dist/language-server.js`),
// so some installers of mise (e.g. aube) create no executable for it.
// Hard-link the native binary of the platform package into the bin directory of the tool instead,
// so that it is exposed on PATH and as a shim.
'use strict';

const fs = require('node:fs');
const path = require('node:path');

const name = 'copilot-language-server';
const exeName = process.platform === 'win32' ? `${name}.exe` : name;
const installPath = process.env.MISE_TOOL_INSTALL_PATH;

// Find the binary in the platform package (e.g. `@github/copilot-language-server-linux-x64`).
// Symbolic links are not followed, since they point into the install directory itself.
function findBinary(dir) {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
        const entryPath = path.join(dir, entry.name);
        if (entry.isDirectory()) {
            const found = findBinary(entryPath);
            if (found) return found;
        } else if (entry.isFile() && entry.name === exeName
            && path.basename(dir).startsWith(`${name}-${process.platform}-`)) {
            return entryPath;
        }
    }
    return null;
}

const binary = findBinary(installPath);
if (!binary) {
    throw new Error(`${exeName} is not found in ${installPath}`);
}

// mise puts the bin directory of the tool on PATH while running postinstall.
// Its location depends on the installer (`node_modules/.bin` or `bin`).
function isInsideInstallPath(p) {
    const relative = path.relative(installPath, p);
    return p !== '' && relative !== '' && !relative.startsWith('..') && !path.isAbsolute(relative);
}
const binDir = process.env.PATH.split(path.delimiter).find(isInsideInstallPath)
    ?? path.join(installPath, 'node_modules', '.bin');
const link = path.join(binDir, exeName);

fs.mkdirSync(binDir, { recursive: true });
fs.rmSync(link, { force: true });
try {
    fs.linkSync(binary, link);
} catch {
    fs.copyFileSync(binary, link);
    fs.chmodSync(link, 0o755);
}
console.log(`${link} -> ${binary}`);
