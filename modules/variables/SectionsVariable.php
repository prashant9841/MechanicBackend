<?php
namespace modules\variables;

use Craft;

class SectionsVariable
{
    public function all()
    {
        return Craft::$app->sections->allSections;
    }

    public function byHandle(string $handle)
    {
        return Craft::$app->sections->getSectionByHandle($handle);
    }
}
