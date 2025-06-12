
# sgu-202563-dynamo-s3-3
-  S3에서 JSON 데이터를 읽어 DynamoDB에 여러 레코드를 저장하는 배치 처리
```python
import json  # JSON 데이터 파싱을 위한 모듈
import boto3  # AWS SDK for Python, AWS 서비스 호출에 사용
from datetime import datetime  # 현재 시간 가져오기에 사용

def lambda_handler(event, context):
    # AWS S3 클라이언트 생성 (S3 서비스와 통신하기 위해)
    s3 = boto3.client('s3')
    # AWS DynamoDB 리소스 생성 (DynamoDB와 통신하기 위해)
    dynamodb = boto3.resource('dynamodb')
    # 'sgu-202563-user-likes-time' 테이블 객체 가져오기
    table = dynamodb.Table('sgu-202563-user-likes-time')
    
    # 읽을 S3 버킷 이름과 파일 경로 설정
    bucket_name = 'sgu-202563-s3'
    object_key = 'dynamo_data/user_likes_data_3.json'
    
    try:
        # 1. S3에서 지정된 파일 가져오기
        response = s3.get_object(Bucket=bucket_name, Key=object_key)
        # S3 파일 내용을 바이트 -> 문자열로 디코딩
        content = response['Body'].read().decode('utf-8')
        # JSON 문자열을 파이썬 리스트(배열)로 변환
        data_list = json.loads(content)
        
        # 2. JSON 배열의 각 항목 반복 처리
        for record in data_list:
            # 각각의 레코드에서 user_id와 product 값 추출
            user_id = record.get('user_id')
            product = record.get('product')
            
            # user_id 또는 product가 없으면 해당 항목 건너뛰기
            if not user_id or not product:
                print(f"user_id 또는 product 누락: {record}")
                continue
            
            # DynamoDB에 넣을 아이템 생성 (현재 시간 timestamp 포함)
            item = {
                'user_id': user_id,
                'timestamp': datetime.now().isoformat(),
                'product': product
            }
            
            # DynamoDB 테이블에 아이템 삽입
            table.put_item(Item=item)
            print(f"Inserted: {item}")
        
        # 모든 레코드 삽입 완료 후 성공 응답 반환
        return {
            'statusCode': 200,
            'body': json.dumps('전체 레코드 Insert 완료', ensure_ascii=False)
        }
    
    except Exception as e:
        # 오류 발생 시 500 에러 코드와 오류 메시지 반환
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)}, ensure_ascii=False)
        }

```
---

# sgu-202563-dynamo
- 단순히 고정된 user_id, product_name을 넣는 예제
```python
import boto3  # AWS SDK for Python 임포트

def lambda_handler(event, context):
    # DynamoDB 리소스 생성
    dynamodb = boto3.resource('dynamodb')
    # 'sgu-202563-user-likes' 테이블 객체 가져오기
    table = dynamodb.Table('sgu-202563-user-likes')
    
    # DynamoDB에 저장할 아이템 생성 및 덮어쓰기(같은 키가 있으면 덮어씀)
    response = table.put_item(
        Item={
            'user_id': 'seung',        # 사용자 ID
            'product_name': '제로콜라'  # 제품 이름
        }
    )
    
    # 처리 완료 응답 반환
    return {
        'statusCode': 200,
        'body': 'PutItem successful!'  # 성공 메시지
    }
```
---

# sgu-202563-dynamo-post-api
- API 요청(body)에서 JSON 데이터 받아 DynamoDB에 저장하는 POST API용 람다
```python
import boto3  # AWS 서비스와 상호작용하기 위한 boto3 라이브러리 임포트
import json   # JSON 데이터를 다루기 위한 json 라이브러리 임포트
from datetime import datetime  # 현재 시간 구하기 위한 datetime 라이브러리 임포트

def lambda_handler(event, context):
    try:
        # event['body']는 HTTP 요청의 본문(body) 문자열을 담고 있음
        # 이 문자열을 JSON 객체로 변환하여 body 변수에 저장
        body = json.loads(event['body'])
        
        # JSON에서 'user_id' 값 추출 (필수)
        user_id = body['user_id']
        # JSON에서 'product' 값 추출 (필수)
        product = body['product']
        # 현재 시간을 ISO 8601 문자열 형식으로 변환하여 timestamp 변수에 저장
        timestamp = datetime.now().isoformat()

        # 선택적 필드인 'reason'이 있으면 가져오고 없으면 None 반환
        reason = body.get('reason')
        # 선택적 필드인 'brand'가 있으면 가져오고 없으면 None 반환
        brand = body.get('brand')
        # 선택적 필드인 'price'가 있으면 가져오고 없으면 None 반환
        price = body.get('price')
        # 선택적 필드인 'color'가 있으면 가져오고 없으면 None 반환
        color = body.get('color')

        # DynamoDB에 저장할 항목 딕셔너리 생성 (기본 필수값 포함)
        item = {
            'user_id': user_id,
            'timestamp': timestamp,
            'product': product
        }

        # reason이 None이 아니면 item에 추가
        if reason:
            item['reason'] = reason
        # brand가 None이 아니면 item에 추가
        if brand:
            item['brand'] = brand
        # price가 None이 아니면 item에 추가
        if price:
            item['price'] = price
        # color가 None이 아니면 item에 추가
        if color:
            item['color'] = color

        # boto3를 사용해 DynamoDB 리소스 가져오기
        table = boto3.resource('dynamodb').Table('sgu-202563-user-likes-time')
        # 테이블에 item 데이터를 저장 (추가 또는 덮어쓰기)
        table.put_item(Item=item)

        # 저장 성공 시 HTTP 200 상태코드와 함께 JSON 응답 반환
        return {
            'statusCode': 200,
            'body': json.dumps({
                'message': '저장 완료',
                'user_id': user_id,
                'timestamp': timestamp
            }, ensure_ascii=False)  # 한글이 깨지지 않도록 설정
        }

    except Exception as e:
        # 에러 발생 시 HTTP 400 상태코드와 에러 메시지 JSON 반환
        return {
            'statusCode': 400,
            'body': json.dumps({
                'error': str(e)  # 에러 내용을 문자열로 변환하여 전달
            }, ensure_ascii=False)  # 한글 깨짐 방지
        }

```
---
# sgu-202563-seung
- 단순 테스트용 람다, 아무 코드와 의존성 없음.
```python
def lambda_handler(event, context):
    # Lambda 함수가 호출되면 항상 이 응답을 반환함
    return {
        "statusCode": 200,  # HTTP 상태 코드 200 (성공)
        "statusDescription": "200 OK",  # 상태 설명
        "isBase64Encoded": False,  # 응답 본문이 Base64 인코딩되지 않았음을 의미
        "headers": {
            "Content-Type": "application/json"  # 응답 본문이 JSON 형식임을 알림
        },
        # 실제 클라이언트에 전달할 응답 본문(JSON 문자열)
        "body": '{"message": "Hello Lambda "}'
    }
```
---
# sgu-202563-fileupload
- S3에 텍스트 파일 업로드 람다
```python
import json
import boto3
from datetime import datetime

def lambda_handler(event, context):
    # S3 클라이언트 생성 (AWS S3 서비스와 통신할 수 있게 함)
    s3 = boto3.client('s3')
    
    # 사용할 버킷 이름 지정
    bucket_name = 'sgu-202563-s3'
    # S3 버킷 내에서 저장할 폴더 경로(접두사) 지정
    prefix = 'uploaded/'

    # 현재 시간을 '년-월-일_시-분-초' 형태의 문자열로 생성
    now = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    
    # 업로드할 파일 이름을 생성 (예: uploaded/hello_2025-06-12_15-30-45.txt)
    filename = f'{prefix}hello_{now}.txt'
    
    # 파일에 쓸 내용 생성 (현재 시간 포함)
    content = f'Hello Seungbeom! This file was created at {now}'

    # S3에 파일 업로드 수행
    s3.put_object(
        Bucket=bucket_name,          # 업로드할 버킷 이름
        Key=filename,                # 버킷 내 저장될 파일 경로 및 이름
        Body=content.encode('utf-8') # 저장할 데이터(문자열을 바이트로 인코딩)
    )

    # Lambda 함수 응답값 반환
    return {
        "statusCode": 200,                 # HTTP 상태 코드 200 (성공)
        "statusDescription": "200 OK",    # 상태 설명
        "isBase64Encoded": False,          # 응답 본문이 Base64 인코딩되지 않음
        "headers": {
            "Content-Type": "application/json"  # 응답 본문은 JSON 형식임을 알림
        },
        "body": '{"message": "업로드 완료"}'    # 클라이언트에 반환할 JSON 메시지
    }

```
---

# sgu-202563-LambdaA
- EC2 상태 체크, 상태가 running이 아니면 SNS로 알림 발송 + LambdaB 호출
```python
# AWS 라이브러리 임포트
import boto3

# EC2 상태를 조회하기 위한 클라이언트 생성
ec2 = boto3.client('ec2')
# SNS(알림) 전송을 위한 클라이언트 생성
sns = boto3.client('sns')
# 다른 Lambda 함수를 호출하기 위한 클라이언트 생성
lambda_client = boto3.client('lambda')

# 점검할 EC2 인스턴스 ID
INSTANCE_ID = 'i-0d31460d55ad0ae82'
# 알림을 보낼 SNS 주제 ARN (Amazon Resource Name)
SNS_TOPIC_ARN = 'arn:aws:sns:ap-northeast-2:443370697536:sgu-202563-alarm'
# 상태가 '중지'일 때 호출할 Lambda 함수 이름
LAMBDA_B_NAME = 'sgu-202563-LambdaB'

# Lambda 함수의 진입점 (이 함수가 실행됨)
def lambda_handler(event, context):
    # EC2 인스턴스의 현재 상태를 조회하는 API 호출
    response = ec2.describe_instance_status(
        InstanceIds=[INSTANCE_ID],   # 점검할 인스턴스 ID 목록
        IncludeAllInstances=True     # 중지된 인스턴스도 포함해서 상태 조회
    )

    # 조회된 상태에서 첫 번째 인스턴스의 상태 이름 가져오기
    state = response['InstanceStatuses'][0]['InstanceState']['Name']
    print(f'EC2 상태: {state}')  # 현재 상태를 로그에 출력

    # 상태가 'running' (실행 중)이 아니라면 아래 동작 수행
    if state != 'running':
        # 경고 메시지 작성
        message = f"경고: EC2 인스턴스 {INSTANCE_ID} 상태가 '{state}'입니다."
        
        # SNS를 사용해 해당 경고 메시지 전송
        sns.publish(
            TopicArn=SNS_TOPIC_ARN,  # 알림을 받을 SNS 주제 지정
            Message=message,         # 전송할 메시지 내용
            Subject="EC2 상태 경고"  # 메일/알림 제목
        )

        # 상태가 'running'이 아닐 때, 다른 Lambda 함수(LambdaB)를 비동기로 호출
        lambda_client.invoke(
            FunctionName=LAMBDA_B_NAME,      # 호출할 Lambda 함수 이름
            InvocationType='Event',          # 비동기 호출 (즉시 반환)
            Payload=f'{{ "InstanceId": "{INSTANCE_ID}" }}'  # LambdaB에 넘길 JSON 문자열 데이터
        )

    # Lambda 함수 실행 결과를 HTTP 상태코드 및 메시지로 반환
    return {
        'statusCode': 200,                    # 정상 처리 응답 코드
        'body': f'EC2 상태는 {state}입니다.'  # 현재 상태 정보 메시지
    }

```
---
# sgu-202563-LambdaB
- LambdaA에서 호출되며, 전달받은 인스턴스 ID로 EC2 인스턴스 시작 요청
```python
# AWS SDK boto3 임포트
import boto3

# EC2 제어용 클라이언트 생성 (EC2 인스턴스 시작, 중지 등 제어 가능)
ec2 = boto3.client('ec2')

# Lambda 함수의 시작점 (자동으로 호출됨)
def lambda_handler(event, context):
    # event 딕셔너리에서 'InstanceId' 키로 EC2 인스턴스 ID 추출 (없으면 None 반환)
    instance_id = event.get('InstanceId')

    # instance_id가 존재할 때만 실행
    if instance_id:
        # 지정한 EC2 인스턴스 시작 요청 API 호출
        ec2.start_instances(InstanceIds=[instance_id])
        # 시작 요청 보냈음을 CloudWatch 로그에 출력
        print(f"EC2 인스턴스 {instance_id} 시작 요청 보냄")

    # Lambda 함수 실행 결과 반환 (HTTP 상태 코드 200과 메시지 포함)
    return {
        'statusCode': 200,
        'body': f"EC2 인스턴스 {instance_id} 시작 처리됨"  # 호출자에게 처리 상태 반환
    }
}

```
---
# Emoji 변환 관련cmd에 작성
# py -3.13 -m pip install emoji -t python/
---

# sgu-202563-layertest
```python
import emoji  # 이모지 변환 라이브러리 임포트

def lambda_handler(event, context):
    # 텍스트에 이모지 별칭(alias) 사용한 문자열 정의
    text = "AWS Lambda is awesome! :rocket:"
    
    # 이모지 별칭을 실제 이모지로 변환
    result = emoji.emojize(text, language='alias')
    
    # 변환된 결과를 로그에 출력 (CloudWatch 로그)
    print(result)

    # Lambda 함수 실행 결과를 HTTP 응답 형태로 반환
    return {
        'statusCode': 200,  # 성공 상태 코드
        'body': result      # 변환된 텍스트 (이모지 포함)
    }
}

```
---
# sgu-202563-requests-get
```python
import requests  # HTTP 요청을 쉽게 보내기 위한 라이브러리 임포트

def lambda_handler(event, context):
    # 호출할 API 주소 지정
    url = "https://httpbin.org/get"
    
    # GET 요청 보내고 응답 받기
    response = requests.get(url)
    
    # 응답을 JSON 형태로 파싱
    data = response.json()
    
    # 받은 데이터 로그에 출력 (CloudWatch에서 확인 가능)
    print("API 응답:", data)

    # Lambda 함수 실행 결과로 HTTP 상태 코드와 응답 데이터 반환
    return {
        'statusCode': 200,   # 성공 상태 코드
        'body': str(data)    # JSON 데이터를 문자열로 변환하여 반환
    }
}

```
---
# HTTP 요청 관련 cmd에 작성
# py -3.13 -m pip install requests -t python/
---


# sgu-202563-request-post
- GET 요청을 외부 API로 보내고 결과를 받음
```python
import emoji  # 이모지 변환 라이브러리 임포트

def lambda_handler(event, context):
    # 텍스트에 이모지 별명(:rocket:)이 포함된 문자열
    text = "AWS Lambda is awesome! :rocket:"
    
    # emoji.emojize 함수로 별명을 실제 이모지로 변환
    # language='alias'는 콜론(:)으로 감싼 별명을 인식하도록 설정
    result = emoji.emojize(text, language='alias')
    
    # 변환된 결과를 로그에 출력 (CloudWatch에서 확인 가능)
    print(result)

    # Lambda 함수 결과로 HTTP 상태 코드와 변환된 이모지 문자열 반환
    return {
        'statusCode': 200,
        'body': result
    }
}

```
---


















