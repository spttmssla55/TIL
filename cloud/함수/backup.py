# sgu-202563-dynamo-s3-3
import json
import boto3
from datetime import datetime

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('sgu-202563-user-likes-time')
    
    bucket_name = 'sgu-202563-s3'
    object_key = 'dynamo_data/user_likes_data_3.json'
    
    try:
        # 1. S3에서 파일 읽기
        response = s3.get_object(Bucket=bucket_name, Key=object_key)
        content = response['Body'].read().decode('utf-8')
        data_list = json.loads(content)  # JSON 배열로 파싱
        
        # 2. 각 항목 반복 처리
        for record in data_list:
            user_id = record.get('user_id')
            product = record.get('product')
            
            if not user_id or not product:
                print(f"user_id 또는 product 누락: {record}")
                continue
            
            item = {
                'user_id': user_id,
                'timestamp': datetime.now().isoformat(),
                'product': product
            }
            
            table.put_item(Item=item)
            print(f"Inserted: {item}")
        
        return {
            'statusCode': 200,
            'body': json.dumps('전체 레코드 Insert 완료', ensure_ascii=False)
        }
    
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)}, ensure_ascii=False)
        }


---

# sgu-202563-dynamo

import boto3

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('sgu-202563-user-likes')
    # 덮어쓰기할 항목
    response = table.put_item(
        Item={
            'user_id': 'seung',
            'product_name': '제로콜라'
        }
    )
    return {
        'statusCode': 200,
        'body': 'PutItem successful!'
}
---

# sgu-202563-dynamo-post-api
import boto3
import json
from datetime import datetime

def lambda_handler(event, context):
    try:
        # 요청 본문 파싱
        body = json.loads(event['body'])
        user_id = body['user_id']
        product = body['product']
        timestamp = datetime.now().isoformat()

        # 선택적 필드들 (있으면 저장, 없으면 None)
        reason = body.get('reason')
        brand = body.get('brand')
        price = body.get('price')
        color = body.get('color')

        # 저장할 항목 구성
        item = {
            'user_id': user_id,
            'timestamp': timestamp,
            'product': product
        }

        # 선택 필드가 있는 경우만 추가
        if reason:
            item['reason'] = reason
        if brand:
            item['brand'] = brand
        if price:
            item['price'] = price
        if color:
            item['color'] = color

        # DynamoDB 저장
        table = boto3.resource('dynamodb').Table('sgu-202563-user-likes-time')
        table.put_item(Item=item)

        return {
            'statusCode': 200,
            'body': json.dumps({
                'message': '저장 완료',
                'user_id': user_id,
                'timestamp': timestamp
            }, ensure_ascii=False)
        }

    except Exception as e:
        return {
            'statusCode': 400,
            'body': json.dumps({
                'error': str(e)
            }, ensure_ascii=False)
        }

---
# sgu-202563-seung

def lambda_handler(event, context):
    return {
    "statusCode": 200,
    "statusDescription": "200 OK",
    "isBase64Encoded": False,
    "headers": {
        "Content-Type": "application/json"
    },
    "body": '{"message": "Hello Lambda "}'
    }

---
# sgu-202563-fileupload



import json
import boto3
from datetime import datetime

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = 'sgu-202563-s3'
    prefix = 'uploaded/'

    now = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    filename = f'{prefix}hello_{now}.txt'
    content = f'Hello Seungbeom! This file was created at {now}'

    s3.put_object(
        Bucket = bucket_name,
        Key = filename,
        Body = content.encode('utf-8')
    )

    
    return {
        "statusCode": 200,
        "statusDescription": "200 OK",
        "isBase64Encoded": False,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": '{"message": "업로드 완료"}'
    }




---

# sgu-202563-LambdaA

# AWS 라이브러리
import boto3

# 상태 클라이언트 생성
ec2 = boto3.client('ec2')
# 알림 클라이언트 생성
sns = boto3.client('sns')
# Lambda 호출 클라이언트 생성
lambda_client = boto3.client('lambda')

# 점검 대상 EC2 인스턴스 ID
INSTANCE_ID = 'i-0d31460d55ad0ae82'
# SNS 주제 ARN (알림 수신자와 연결된 주제)
SNS_TOPIC_ARN = 'arn:aws:sns:ap-northeast-2:443370697536:sgu-202563-alarm'
# 상태가 중지일 때 호출할 Lambda 함수 이름 (LambdaB)
LAMBDA_B_NAME = 'sgu-202563-LambdaB'

# Lambda 실행하면 호출되는 함수
def lambda_handler(event, context):
    # EC2 현재 상태를 조회
    response = ec2.describe_instance_status(
        InstanceIds=[INSTANCE_ID],
        IncludeAllInstances=True  # 중지도 포함하여 조회
    )

    # 인스턴스 상태를 추출
    state = response['InstanceStatuses'][0]['InstanceState']['Name']
    print(f'EC2 상태: {state}')  # 상태를 로그로 출력

    # 인스턴스 상태가 'running'이 아닌 경우
    if state != 'running':
        # 경고 메시지 생성
        message = f"경고: EC2 인스턴스 {INSTANCE_ID} 상태가 '{state}'입니다."
        
        # SNS를 통해 경고 이메일 알림 전송
        sns.publish(
            TopicArn=SNS_TOPIC_ARN,
            Message=message,
            Subject="EC2 상태 경고"
        )

        # LambdaB를 비동기 방식으로 호출하여 시작하도록 함
        lambda_client.invoke(
            FunctionName=LAMBDA_B_NAME,
            InvocationType='Event',  # 비동기 호출
            Payload=f'{{ "InstanceId": "{INSTANCE_ID}" }}'  # 시작할 인스턴스 ID 전달
        )

    # 반환값
    return {
        'statusCode': 200,  # 성공 상태 
        'body': f'EC2 상태는 {state}입니다.'  # 상태 메시지 반환
    }


---
# sgu-202563-LambdaB

# AWS 서비스 사용 가능 라이브러리
import boto3

# EC2 제어 클라이언트 생성
ec2 = boto3.client('ec2')

# 실행하면 자동으로 호출
def lambda_handler(event, context):
    # LambdaA -> 'InstanceId' 추출
    instance_id = event.get('InstanceId')

    # 존재하면 실행
    if instance_id:
        # EC2 시작 요청
        ec2.start_instances(InstanceIds=[instance_id])
        # CloudWatch 로그 메시지 출력
        print(f"EC2 인스턴스 {instance_id} 시작 요청 보냄")

    # 실행 결과 반환
    return {
        'statusCode': 200, 
        'body': f"EC2 인스턴스 {instance_id} 시작 처리됨"  # 처리 메시지 반환
    }

---
# py -3.13 -m pip install emoji -t python/
---

# sgu-202563-layertest
import emoji

def lambda_handler(event, context):
    text = "AWS Lambda is awesome! :rocket:"
    result = emoji.emojize(text, language='alias')
    print(result)

    return {
        'statusCode': 200,
        'body': result
    }

---
# sgu-202563-requests-get

import requests

def lambda_handler(event, context):
    url = "https://httpbin.org/get"
    response = requests.get(url)
    data = response.json()
    print("API 응답:", data)

    return {
        'statusCode': 200,
        'body': str(data)
    }



---
# py -3.13 -m pip install requests -t python/
---


# sgu-202563-request-post

import emoji

def lambda_handler(event, context):
    text = "AWS Lambda is awesome! :rocket:"
    result = emoji.emojize(text, language='alias')
    print(result)

    return {
        'statusCode': 200,
        'body': result
    }

---


















