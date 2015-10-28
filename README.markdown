#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with carbon_relay_ng](#setup)
    * [What carbon_relay_ng affects](#what-carbon_relay_ng-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with carbon_relay_ng](#beginning-with-carbon_relay_ng)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The carbon_relay_ng module configures and manages the carbon-relay-ng application.

## Module Description

A relay for carbon streams, in go. Like carbon-relay from the graphite project, except it:

- performs better: should be able to do about 100k ~ 1M million metrics per second depending on configuration
- Can adjust the routing table at runtime, in real time using the web or telnet interface (interfaces need more work)
- Has aggregator functionality built-in
- Supports a per-route spooling policy. (i.e. in case of an endpoint outage, can temporarily queue the data up to disk and resume later)
- Can choose between plaintext or pickle output, per route.
- Can be restarted without dropping packets (needs testing)
- Performs validation on all incoming metrics (see below)

## Setup

### What carbon_relay_ng affects

* A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

- Configuration files (create and written to)
- Package/service/configuration files for carbon-relay-ng

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled, etc.), mention it here. 

### Beginning with carbon_relay_ng

To have Puppet install carbon-relay-ng with the default parameters, declare the carbon_relay_ng class:

~~~ puppet
class { 'carbon_relay_ng': }
~~~

You can customize parameters when declaring the carbon_relay_ng class.
For instance, this declaration configures a different listenting port:

~~~ puppet
class { 'carbon_relay_ng':
  listen_port => '2103',
}
~~~

## Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here. 

## Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You may also add any additional sections you feel are necessary or important to include here. Please use the `## ` header. 
