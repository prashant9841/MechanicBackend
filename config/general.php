<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\config\GeneralConfig;
use craft\helpers\App;


return GeneralConfig::create()
    ->isSystemLive(App::env('IS_SYSTEM_LIVE') ?? true)
    ->devMode(App::env('DEV_MODE') ?? false)
    ->allowAdminChanges(App::env('ALLOW_ADMIN_CHANGES') ?? false)
    ->disallowRobots(App::env('DISALLOW_ROBOTS') ?? false)
    ->testToEmailAddress(App::env('TEST_TO_EMAIL_ADDRESS') ?? false)
    ->cpTrigger(App::env('CP_TRIGGER') ?? 'sitemgr')
    ->allowUpdates(App::env('ALLOW_UPDATES') ?? true)
    ->errorTemplatePrefix('_exceptions/')
    ->enableGql(1)
    ->useEmailAsUsername(1)
    ->autoLoginAfterAccountActivation(1)
    ->omitScriptNameInUrls(1)
    ->preloadSingles(1)
    ->preventUserEnumeration(1)
    ->defaultCpLanguage('en-NZ')
    ->defaultCpLocale('en-NZ')
    ->defaultCountryCode('NZ')
    ->defaultImageQuality(100)
    ->brokenImagePath('@webroot/assets/images/fallback.png')
    ->transformGifs(false)
    ->generateTransformsBeforePageLoad(true)
    ->maxUploadFileSize('25M')
    ->enableTemplateCaching(false)
    ->partialTemplatesPath('_blocks')
    ->cpHeadTags([
        ['link', ['rel' => 'icon', 'href' => '/assets/favicons/favicon.ico']],
    ])
    ->aliases([
        '@web' => App::env('SITE_URL'),
        '@webroot' => App::env('WEB_ROOT'),
    ]);
