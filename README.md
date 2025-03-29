# Font Awesome Quarto Extension


This Quarto extension enables the use of Font Awesome icons within
Quarto documents using shortcodes. It supports standalone icons,
icon-based lists, and custom styling options.

## Installation

    quarto add dsjlu/quarto-fa

## Usage

### Standalone Icons

To insert a Font Awesome icon in your Quarto document, use:

```
{{< fa-i bell color=#ff5733 >}}
```

![](README_img/screenshot_1.png)

#### Available Parameters:

- `group`: Icon group (e.g., `solid`, `brands`, `regular`). Default is
  `solid`.
- `color`: Hex color code for the icon (e.g., `#ff5733`).

### Icon Lists

Create unordered lists with icons as bullets using:

```
{{< fa-ul >}}
  {{< fa-li check-square color=#28a745 >}} List item one {{< /fa-li >}}
  {{< fa-li spinner fa-pulse color=#007bff >}} List item two {{< /fa-li >}}
  {{< fa-li square color=#6c757d >}} List item three {{< /fa-li >}}
{{< /fa-ul >}}
```

![](README_img/screenshot_2.png)

#### Explanation:

- `fa-ul`: Opens an unordered list with `fa-ul` class.
- `fa-li`: Adds an item with an icon from Font Awesome. (Optional
  styling attributes: `color`, `group`)
