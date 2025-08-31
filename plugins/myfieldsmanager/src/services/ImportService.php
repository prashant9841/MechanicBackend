use Craft;
use craft\fields\PlainText;

class ImportService
{
    public function importFieldsFromJson(string $jsonData)
    {
        $fieldsData = json_decode($jsonData, true);
        foreach ($fieldsData as $fieldData) {
            $this->createField($fieldData);
        }
    }

    private function createField(array $fieldData)
    {
        $field = Craft::$app->fields->createField([
            'type' => $fieldData['type'],
            'name' => $fieldData['name'],
            'handle' => $fieldData['handle'],
            'settings' => $fieldData['settings'] ?? [],
        ]);

        if (!Craft::$app->fields->saveField($field)) {
            Craft::error('Failed to import field: ' . json_encode($field->getErrors()), __METHOD__);
        }
    }
}
