<?php
namespace modules;

use yii\base\Module;
use Craft;

class SectionsModule extends Module
{
    public function init()
    {
        parent::init();

        // Correct way to access all sections in Craft CMS 5
        $sectionsService = Craft::$app->getSections();
        $sections = $sectionsService->allSections;

        echo "<pre>";
        foreach ($sections as $section) {
            echo $section->name . " (" . $section->handle . ")\n";
        }
        echo "</pre>";
    }
}
