# ext_group-apm
a php extension for monitor your code performance.

#### Install

    phpize
    ./configure
    make && make install

#### php.ini config 
    
    //default is 1;
    group_apm.enabled = 1;

#### Get start

```php 
    <?php
    /*
     * your code
     * do something
     *
     *
     */

    //get the monitor
    $data = group_apm();

```

#### data sample

```php 
    
    array (
      't' => 0.0019829273223876953,
      'cf' => 'Group\\App\\App::__construct=>/private/var/www/Group/vendor/group/group-framework/core/Group/App/App.php:78',
      'id' => 29,
      'pf_id' => 22,
    )

```

- t => the func call time 
- cf => func name and filename:line
- id => current func id
- pf_id => parent func id

#### tips

It will record the func calltime > 1ms.

#### example1

    php example/group_res.php

#### example2

    php example/group_apm.php