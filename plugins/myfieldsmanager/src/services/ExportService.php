use Craft;

class ExportService
{
    public function exportFields(): array
    {
        $fields = Craft::$app->fields->getAllFields();
        $exportData = [];

        foreach ($fields as $field) {
            $exportData[] = [
                'name' => $field->name,
                'handle' => $field->handle,
                'type' => get_class($field),
                'settings' => $field->getSettings(),
            ];
        }

        return $exportData;
    }

    public function exportAsJson(): string
    {
        return json_encode($this->exportFields(), JSON_PRETTY_PRINT);
    }
}
