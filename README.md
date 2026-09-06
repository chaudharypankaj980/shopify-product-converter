# Shopify Product Converter

A Tkinter desktop application and local browser app that converts medicine product Excel files into a Shopify-compatible Excel import file.

## Features

- Reads a source Excel file and an optional Shopify Excel template.
- Maps medicine product fields into Shopify's product import format.
- Generates Shopify handles from product titles.
- Builds HTML descriptions from Introduction, Benefits, How to Use, and Safety Advice fields.
- Supports multiple product images by creating Shopify image rows.
- Optional output repeats the full product data for every separate image link.
- Cleans currency-formatted prices into numeric values.
- Extracts variant weight and variant weight unit from related source columns.
- Populates common Shopify defaults such as Published, Status, Inventory Policy, Fulfillment Service, Requires Shipping, and Taxable.
- Exports the finished Excel file to the output folder.
- Logs conversion activity and errors.

## Easy Browser App

Double-click:

```text
Run Web App.bat
```

It will open the converter in your browser at:

```text
http://127.0.0.1:5000
```

Then upload:

1. Your source medicine Excel file.
2. Your Shopify template Excel file, or leave it empty to use the built-in Shopify columns.
3. Choose a download format.
4. Click **Convert and Download**.

The finished Shopify-ready Excel file will download in the browser and also be saved in the `output/` folder.

## Download Formats

| Format | Use When |
| --- | --- |
| Shopify import format | You want Shopify's normal format. Extra image rows contain the handle and image fields only. |
| Same product data repeated for each separate image link | You want every image row to also include the full product data, which is easier for checking, editing, or sharing. |

## Manual Setup

```bash
python -m venv .venv
```

Windows Command Prompt:

```cmd
.venv\Scripts\activate.bat
```

PowerShell:

```powershell
.\.venv\Scripts\Activate.ps1
```

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

Run the browser app:

```bash
python src/web_main.py
```

Run the desktop Tkinter app:

```bash
python src/main.py
```

## Expected Source Columns

The converter is flexible with common column names. These names are supported by default:

| Product Data | Supported Source Column Names |
| --- | --- |
| Title | Title, Product Title, Product Name, Item Name, Name, Medicine Name, Drug Name |
| Vendor | Vendor, Vendor Name, Vendor Data, Brand, Brand Name, Manufacturer, Company, Supplier, Marketed By |
| Type | Type, Product Type, Category, Main Category, Medicine Category |
| Tags | Tags, Tag, Keywords, Search Tags, Product Tags |
| SKU | SKU, Variant SKU, Product Code, Item Code, Code, Product ID |
| Barcode | Barcode, Variant Barcode, GTIN, UPC, EAN, ISBN |
| Price | Selling Price, Sale Price, Offer Price, Discounted Price, Final Price, Net Price, Price, Variant Price |
| Compare Price | Compare At Price, Compare Price, MRP, List Price, Regular Price, Maximum Retail Price |
| Quantity | Quantity, Inventory Qty, Inventory Quantity, Stock, Stock Quantity, Available Stock, Qty |
| Weight | Weight, Variant Weight, Product Weight, Shipping Weight, Weight Grams, Net Weight |
| Weight Unit | Weight Unit, Variant Weight Unit, Product Weight Unit, Shipping Weight Unit, Weight UOM |
| Images | Images, Image URLs, Image URL, Image Src, Image, Photos, Photo URLs, Product Images |
| Introduction | Introduction, Intro, Description, Short Description, Product Description, Overview |
| Benefits | Benefits, Key Benefits, Uses, Product Benefits |
| How to Use | How to Use, Usage, Directions, Directions for Use, Dosage, Use Instructions |
| Safety Advice | Safety Advice, Warnings, Precautions, Caution, Safety Information, Side Effects |

Multiple images can be separated with commas, semicolons, pipes, or new lines.

Weights can be in one column such as `500 mg`, `10 g`, or `0.5 kg`, or split across separate weight and weight unit columns. Shopify-compatible units are normalized to `g`, `kg`, `lb`, or `oz`; milligrams are converted to grams.

## Project Structure

```text
shopify-product-converter/
  input/
  output/
  templates/
  logs/
  src/
    shopify_product_converter/
      app.py
      converter.py
      exporter.py
      html_generator.py
      image_processor.py
      mapper.py
      models.py
      reader.py
      utils.py
      web_app.py
    main.py
    web_main.py
  requirements.txt
  Run Web App.bat
  README.md
```
