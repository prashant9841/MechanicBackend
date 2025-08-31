<?php

namespace yournamespace\myfieldsmanager;

use Craft;
use craft\base\Plugin;

class MyFieldsManager extends Plugin
{
    public bool $hasCpSettings = true; // Enables settings in the CP
    public bool $hasCpSection = false; // Set to true if adding a CP section

    public function init()
    {
        parent::init();
        Craft::info('MyFieldsManager loaded', __METHOD__);
    }

    protected function createSettingsModel(): ?craft\base\Model
    {
        return new \yournamespace\myfieldsmanager\models\Settings();
    }
}
