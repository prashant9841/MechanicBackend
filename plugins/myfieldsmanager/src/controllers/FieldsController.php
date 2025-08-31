use Craft;
use craft\web\Controller;
use yii\web\Response;

class FieldsController extends Controller
{
    protected array|int|bool $allowAnonymous = false;

    public function actionExport(): Response
    {
        $exportData = MyFieldsManager::$plugin->exportService->exportAsJson();
        return Craft::$app->response->sendContentAsFile($exportData, 'fields.json', 'application/json');
    }

    public function actionImport(): Response
    {
        $file = Craft::$app->request->getUploadedFile('fieldsFile');
        if (!$file) {
            return $this->asJson(['success' => false, 'error' => 'No file uploaded']);
        }

        $jsonData = file_get_contents($file->tempName);
        MyFieldsManager::$plugin->importService->importFieldsFromJson($jsonData);

        return $this->asJson(['success' => true]);
    }
}
