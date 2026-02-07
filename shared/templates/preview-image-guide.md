# Preview Image Guide

How to create a 1200x630px social media preview image for your Medium article.

---

## Quick Start (5 minutes)

### Option 1: HTML Template (Recommended)

1. Copy `shared/assets/preview-image.html` to your article's `visuals/` folder
2. Edit the HTML to update:
   - Title text
   - Stats (numbers and labels)
   - Tagline
   - Badge text
   - Author/footer text
3. Open in browser
4. Screenshot at 1200x630px (see instructions below)
5. Save as PNG

### Option 2: Minimal Template

Use `shared/assets/preview-image-minimal.html` for a clean white/black design.

### Option 3: Canva

1. Go to canva.com
2. Create design -> Custom size: 1200 x 630 px
3. Follow the layout from the HTML template
4. Export as PNG

---

## Screenshot Instructions

### macOS
- Cmd+Shift+5 -> Select "Capture Selected Portion"
- Drag to select the preview container
- Click "Capture"

### Chrome/Edge
- F12 -> Toggle Device Toolbar (Ctrl+Shift+M)
- Set dimensions: 1200 x 630
- Right-click preview -> "Capture screenshot"

### Firefox
- F12 -> Responsive Design Mode (Ctrl+Shift+M)
- Set 1200x630
- Screenshot button in toolbar

### CLI (Node.js)
```bash
npx capture-website preview-image.html --output=preview.png --width=1200 --height=630
```

---

## Design Specs

### Default Template (Purple Gradient)
- Background: Linear gradient (#667eea to #764ba2)
- Font: System font stack (-apple-system, etc.)
- Title: 56px bold white, highlight color #ffd700
- Stats: 4 cards with glassmorphism effect
- Size: 1200x630px (Open Graph standard)

### Minimal Template (White)
- Background: White
- Text: Black
- Accent: Purple gradient line at bottom
- Clean, centered layout

---

## Customization Tips

- **Title**: Keep under 3 lines in the preview
- **Stats**: Use 3-4 key numbers that tell the story
- **Tagline**: One memorable phrase that captures the article's thesis
- **Colors**: Purple gradient works universally; adapt if your brand has specific colors

---

## Where Preview Images Appear

| Platform | How It's Used |
|----------|---------------|
| Medium | Story preview card, Open Graph image |
| LinkedIn | Auto-fetched when sharing link |
| Twitter/X | Twitter Card preview |
| Facebook | Auto-fetched Open Graph |

### Troubleshooting

- **Image not showing**: Use platform debugger tools (LinkedIn: edit preview, Twitter: Card Validator, Facebook: Sharing Debugger)
- **Image blurry**: Use 100% browser zoom, export as PNG not JPG
- **Wrong dimensions**: Must be exactly 1200x630px
- **File too large**: Keep under 5MB (PNG should be ~200-500KB)
