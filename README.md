
[![Build Status][build-shield]][build-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GPL License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/F0xedb/README-generator">
    <img src="https://tos.pbfp.xyz/images/logo.svg" alt="Logo" width="150" height="200">
  </a>

  <h3 align="center">README-generator</h3>

  <p align="center">
    A simple readme generator
    <br />
    <a href="https://github.com/F0xedb/README-generator"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/F0xedb/README-generator">View Demo</a>
    ·
    <a href="https://github.com/F0xedb/README-generator/issues">Report Bug</a>
    ·
    <a href="https://github.com/F0xedb/README-generator/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

All you need is bash with gnu utilities


### Installation
 
1. Clone the README-generator
```sh
git clone https:://github.com/F0xedb/README-generator.git
```
2. Install packages
```sh
chmod +x readme-gen
cp readme-gen /usr/bin
mkdir -p .cache/readme
cp demo .cache/readme/demo
```

Alternativly arch users can do the following

```bash
yay -Syu readme-gen
```



<!-- USAGE EXAMPLES -->
## Usage

Simply run
```bash
readme-gen
```
And answer all questions.
It will generate the readme file in the current dir.

### config

Alternativly you can use a config file and based on that generate a readme.

```bash
readme-gen -c config
```

The config file will look something like this

```bash
#example config file for the readme generator

# Set the theme to generate from
# If it is not specified the theme will be "demo"
theme="demo"

# General settings. These must be present in this config otherwise they will be empty in the final result
repo="README-generator" # this will autofill to https://www.github.com/F0xedb/README-generator inside the readme template
org_name="F0xedb"
usr_name="$org_name" # You can reference other variables like this
usr_email="tom@pbfp.team"

title="README generator"
desc="A simple readme generator"

doc="https://www.pbfp.xyz"

license="GPL"

image_url="https://tos.pbfp.xyz/images/logo.svg"
width="150" # width of the image in pixels
height="200" # height of the image in pixels
```

This is the example used for generating this readme.

### templates

To add a readme template to this tool use the following

```bash
readme-gen --add template
```

The template works as followed. 
All variables are used in this simple example

```markdown

<a href="https://github.com/org_name/repo">
   <img src="image_url" alt="Logo" width="width_img" height="height_img">
</a>

# title
desc_var

## extra

build by
usr_name - usr_email

repo is build using license_var

_more info refer to the [Documentation](doc_var)

```

You can also list all the current existing theme and also tell the tool which theme to use

```bash
readme-gen --list # this lists all the known templates
readme-gen --theme <template> # the readme will be generated using the <template> theme
```


_For more examples, please refer to the [Documentation](https://github.com/F0xedb/README-generator/wiki)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/F0xedb/README-generator/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the GPL License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Tom Meyers - tom@pbfp.xyz

Project Link: [https://github.com/F0xedb/README-generator](https://github.com/F0xedb/README-generator)




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[build-shield]: https://jenkins.pbfp.xyz/buildStatus/icon?job=README-gen&style=flat-square
[build-url]: https://jenkins.pbfp.xyz/job/README-gen/
[contributors-shield]: https://img.shields.io/github/contributors/F0xedb/README-generator.svg?style=flat-square
[contributors-url]: https://github.com/F0xedb/README-generator/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/F0xedb/README-generator.svg?style=flat-square
[forks-url]: https://github.com/F0xedb/README-generator/network/members
[stars-shield]: https://img.shields.io/github/stars/F0xedb/README-generator.svg?style=flat-square
[stars-url]: https://github.com/F0xedb/README-generator/stargazers
[issues-shield]: https://img.shields.io/github/issues/F0xedb/README-generator.svg?style=flat-square
[issues-url]: https://github.com/F0xedb/README-generator/issues
[license-shield]: https://img.shields.io/github/license/F0xedb/README-generator.svg?style=flat-square
[license-url]: https://github.com/F0xedb/README-generator/blob/master/LICENSE.txt
[product-screenshot]: https://tos.pbfp.xyz/images/logo.svg
