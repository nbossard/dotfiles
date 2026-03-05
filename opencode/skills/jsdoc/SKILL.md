---
name: jsdoc
description: ALWAYS load this skill BEFORE writing or adding JSDoc comments to JavaScript/TypeScript functions, classes, or types. Generates strict JSDoc following @typedef conventions.
license: MIT
metadata:
  audience: developers
  style: strict
  max-lines: 10
---

## When to use me
Load this skill AUTOMATICALLY when:
- Adding or modifying documentation to JavaScript/TypeScript code
- Creating JSDoc comments for functions, methods, or classes
- Documenting type definitions or interfaces
- User asks to "document", "add JSDoc", or "comment" code

## Rules (STRICT - follow exactly)
1. Use @typedef for complex types with @property annotations
2. @param {TypeName} paramName - With short descriptions
3. @returns {TypeName} - Simple return type only
4. include if useful: @throws, @deprecated
6. One-line format for simple functions: /** @param {Type} name @returns {Type} */

## Type pattern examples
```javascript


/**
 * @typedef {Object} AnalysisQrcode
 * @property {string} raw - Raw content of the QR code
 * @property {string} type - Type of the QR code
 * @property {string} error - Error message if QR code analysis failed
 */
/**
 * The Analysis object returned by FraudBuster API
 * @typedef {Object} Analysis
 * @property {AnalysisUUID} id - Unique identifier of the analysis
 * @property {AnalysisQrcode} [qrcode] - QR code information (if applicable)
 * @property {string} [error] - Error message if an error occurred during the analysis (filled if analysis state is "error")
 */

 /**
 * @param {Analysis} analysis
 * @returns {void}
 */
function setup(analysis) { }
```
