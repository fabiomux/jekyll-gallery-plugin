# Jekyll-Gallery

This is a Jekyll plugin that provides a Liquid tag to render one of the named named galleries declared
in the Front Matter inside the content, using a customizable template which, out of the bo, supports the
Javascript [Glightbox library][glightbox].

It also takes care of the gallery integrity at the compile time:
- checking for the *file* field presence;
- checking for the files presence within the related path.

Everytime one of these constraints is broken, an error message is raised, blocking any further action.

As an extra feature, the filesystem organization-and-check supports the *image* field declared for the
[Jekyll-Seo-Tag plugin][seotag] implementing the subkey *cover*.

[![Ruby](https://github.com/fabiomux/jekyll-gallery-plugin/actions/workflows/main.yml/badge.svg)][wf_main]
[![Gem Version](https://badge.fury.io/rb/jekyll-gallery-plugin.svg)][gem_version]

## Installation

Can install the gem either manually or using *Bundler*.

### Using Bundler

Install the gem and add to the application's Gemfile by executing:

    $ bundle add jekyll-gallery-plugin --group jekyll_plugins

### Manually

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install jekyll-gallery-plugin

Then, add the following code within the Gemfile of your Jekyll project:

    ```ruby
    group :jekyll_plugins do
      ...
      gem 'jekyll-gallery-plugin'
    end
    ```

## Configuration

Inside the `_config.yml` file can set up the following fields:
```yaml
jekyll-gallery:
  assets_path: assets/images
  collections_dir:
    posts: posts
    downloads: downloads
    ...
```

The assigned values are the default values.

*assets_path*
: This is the general path where assets lie, these files will be directly served by Jekyll so you will
  have this same prefix path in your images as well.

*collections_dir*
: This is where can specify a folder name for each collection, by default it takes the slug of the
  collection itself.

## Usage

The usage of this plugin is splitted in two parts:
1. The Front Matter to declare the galleries;
2. the content, placing the *gallery* tag to render the gallery declared.

So to declaration will be something like:
```yaml
gallery:
  gallery_name_1:
  - file: subfolder_1/image_name_1.jpg
    title: "Title 1"
    description: "Description 1"
  - file: subfolder_1/image_name_2.jpg
    title: "Title 2"
    description: "Description 2"
  - file: subfolder_1/image_name_3.jpg
    title: "Title 3"
    description: "Description 3"
  gallery_name_2:
  - file: subfolder_2/image_name_1.jpg
    title: "Title 1"
    description: "Description 1"
```

Each gallery has a *name* that introduces the list of items (*gallery_name_1*, *gallery_name_2*), each
items must provide the *file* field with the relative path, a *title* and a *description*

Supposing we are filling a *posts* content, and using all the default values, the images will take place
under the *assets/images/posts/subfolder_1/...* and *assets/images/posts/subfolder_2/...* following the
scheme:

    <assets_path>/<collections_dir>/<image_folder_and_filename>

To render the gallery in whatever point within the content:

    {% gallery name='<gallery_name>' %}

For example to render the second gallery:
```liquid
{% gallery name='gallery_name_2' %}
```

## More Help

More info is available at:
- the [project page on the Freeaptitude blog][project_page];
- the [Jekyll-Gallery Github wiki][jekyll_gallery_wiki].

[glightbox]: https://biati-digital.github.io/glightbox/ "Glightbox Javascript plugin Home page"
[seotag]: https://github.com/jekyll/jekyll-seo-tag "Jekyll-Seo-Tag Github repository"
[wf_main]: https://github.com/fabiomux/jekyll-gallery-plugin/actions/workflows/main.yml
[gem_version]: https://badge.fury.io/rb/jekyll-gallery-plugin
[project_page]: https://freeaptitude.altervista.org/projects/jekyll-gallery.html "Project page on the Freeaptitude blog"
[jekyll_gallery_wiki]: https://github.com/fabiomux/jekyll-gallery-plugin/wiki "Jekyll-Gallery wiki page on GitHub"
