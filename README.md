# fluttiyomi

## Creating YAML sources

In order to use the code you provided to scrape a page, a user will need to create a YAML file that follows a specific structure. This file will contain the schema for how the page should be parsed.

The root level of the YAML file should contain a baseUrl field and one or more page fields. The baseUrl field specifies the base URL of the website being scraped, and the page fields contain the schema for each type of page that can be scraped.

Each page field should have a name field, which specifies the name of the page, and a selector field, which specifies the CSS selector for the root element of the page.

Inside the page field, there should be a fields field, which contains a list of fields to extract from the page. Each field should have a name field, which specifies the name of the field, and a selector field, which specifies the CSS selector for the element containing the field's value.

Optionally, a field can also have an attribute field, which specifies the attribute of the element to extract the value from. If no attribute field is specified, the element itself will be used as the value.

If a field contains multiple values, it can have a list field set to true, and an additional items field, which contains the schema for each item in the list.

A field can also have a defaultValue field, which specifies the default value to use if the field's value is not found on the page.

Finally, a field can have a transformers field, which contains a list of transformers to apply to the field's value. Each transformer should have a type field, which specifies the type of transformer to use, and any additional fields required by the transformer.

Here is an example YAML file with a single page named "Chapter Details" that extracts the title and a list of images from a web page:

```baseUrl: "https://example.com"

page:
  name: "Chapter Details"
  selector: "#page-container"
  fields:
    - name: "title"
      selector: "h1.title"
    - name: "images"
      selector: "img"
      list: true
      items:
        - selector: "img"
          attribute: "src"
