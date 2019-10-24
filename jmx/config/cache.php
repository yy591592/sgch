<?php


return [
    // 使用复合缓存类型
    'type' => 'complex',
    // 默认使用的缓存
    'default' => [
        // 驱动方式
        'type' => 'file',
        // 缓存保存目录
        'path' => '../runtime/default',
    ],
    // 文件缓存
    'file' => [
        // 驱动方式
        'type' => 'file',
        // 设置不同的缓存保存目录
        'path' => '../runtime/file/',
    ],
    // redis缓存
    'redis' => [
        // 驱动方式
        'type' => 'redis',
        // 服务器地址
        'host' => '127.0.0.1',
        'port' => '6379',
        'auth' => 'admin123'
    ]
];