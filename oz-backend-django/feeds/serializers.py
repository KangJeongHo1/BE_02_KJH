from rest_framework.serializers import ModelSerializer
from .models import Feed
from users.serializers import FeedUserSerializer
from reviews.serializer import ReviewSerializer
class FeedSerializer(ModelSerializer):
    user = FeedUserSerializer()
    review_set =  ReviewSerializer(many=True, read_only=True)  # < 역참조로 인한 .set

    class Meta:
        model = Feed
        fields = "__all__"
        depth = 1   # user 객체 해석